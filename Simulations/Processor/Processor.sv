`include "../InstructionMemory/InstructionMemory.sv"
`include "../ProgramCounter/ProgramCounter.sv"
`include "../ALUOP/ALU.sv"
`include "../BranchUnit/BranchUnit.sv"
`include "../ControlUnit/ControlUnit.sv"
`include "../DataMemory/DataMemory.sv"
`include "../ImmediateGenerator/ImmediateGenerator.sv"
`include "../Registers/RegisterUnit.sv"



module Processor(
    input logic clk
);

    //pc_plus-4
    logic [31:0] pc_out_plus_4;

    //Program Counter
    logic [31:0] pc_out;
    logic [31:0] instruction;
    logic [31:0] pc_input;

    //Control Unit
    logic [6:0] opcode;
    logic [2:0] Funct3;
    logic [6:0] Funct7;
    logic ALUASrc;
    logic ALUBSrc;
    logic [3:0] ALUOp;
    logic DMWr;
    logic [2:0] DMCtrl;
    logic [1:0] RUDataWrSrc;

    //Registers Unit
    logic [4:0] rs1;
    logic [4:0] rs2;
    logic [4:0] rd;
    logic [31:0] DataWr;
    logic RUWr;
    logic [31:0] RURs1;
    logic [31:0] RURs2;

    //Imm Generator
    logic [24:0] Inst;
    logic [2:0] ImmSrc;
    logic [31:0] ImmExt;

    //Branch Unit
    logic [4:0] BrOp;
    logic NextPCSrc;

    //ALU
    logic [31:0] A;
    logic [31:0] B;
    logic [31:0] S;

    //Data Memory
    logic [31:0] Address;
    logic [31:0] DataRd;
    

    
    ProgramCounter PC(
        .clk(clk),
        .pc_input(pc_input),  // Inicializar pc_input en 0 solo una vez
        .pc_out(pc_out)
    );

    // Instanciar el módulo InstructionMemory
    InstructionMemory IM(
        .address(pc_out),
        .instruction(instruction)
    );

    // Extraer los bits 6 al 0 de la instrucción para el OpCode
    assign opcode = instruction[6:0];
    assign Funct3 = instruction[14:12];
    assign Funct7 = instruction[31:25];

    // Instanciar el módulo ControlUnit
    ControlUnit CO(
        .opcode(opcode),
        .Funct3(Funct3),
        .Funct7(Funct7),
        .RUWr(RUWr),
        .ImmSrc(ImmSrc),
        .ALUASrc(ALUASrc),
        .ALUBSrc(ALUBSrc),
        .ALUOp(ALUOp),
        .BrOp(BrOp),
        .DMWr(DMWr),
        .DMCtrl(DMCtrl),
        .RUDataWrSrc(RUDataWrSrc)
        // Pasa otras entradas y salidas según sea necesario
    );

    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    assign rd = instruction[11:7];



    RegisterUnit RUnit(
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .DataWr(RUDataWrSrc == 2'b10 ? pc_out_plus_4 : RUDataWrSrc == 2'b01 ? DataRd : RUDataWrSrc == 2'b00 ? S : 2'b00),
        .RUWr(RUWr),
        .clk(clk),
        .RURs1(RURs1),
        .RURs2(RURs2)
    );

    assign Inst = instruction[31:7];

    ImmediateGenerator IG(
        .Inst(Inst),
        .ImmSrc(ImmSrc),
        .ImmExt(ImmExt)
    );

    BranchUnit BU(
        .RURs1(RURs1),
        .RURs2(RURs2),
        .BrOp(BrOp),
        .NextPCSrc(NextPCSrc)
    );

    always @* begin
        pc_out_plus_4 = pc_out + 4;

        if (ALUASrc) begin
            A <= pc_out;
        end else begin
            A <= RURs1;
        end

        if (ALUBSrc) begin
            B <= ImmExt;
        end else begin
            B <= RURs2;
        end

        if (NextPCSrc) begin
            pc_input <= S;
        end else begin
            pc_input <= pc_out_plus_4;
        end

        /*case(RUDataWrSrc)
            2'b10: begin
                DataWr = pc_out_plus_4;
            end
            2'b01: begin
                DataWr = DataRd;
            end
            2'b00: begin
                DataWr = S;
            end
        endcase*/
    end


    ALU ALU(
        .A(A),
        .B(B),
        .AluOp(ALUOp),
        .S(S)
    );

    DataMemory DM(
        .Address(S),
        .DataWr(RURs2),
        .DMWr(DMWr),
        .DMCtrl(DMCtrl),
        .DataRd(DataRd)
    );

endmodule
