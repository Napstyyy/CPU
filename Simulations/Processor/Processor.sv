`include "../InstructionMemory/InstructionMemory.sv"
`include "../ProgramCounter/ProgramCounter.sv"
`include "../ALUOP/ALU.sv"
`include "../BranchUnit/BranchUnit.sv"
`include "../ControlUnit/ControlUnit.sv"
`include "../DataMemory/DataMemory.sv"
`include "../ImmediateGenerator/ImmediateGenerator.sv"
`include "../Registers/RegisterUnit.sv"
`include "../HazardDetectionUnit/HazardDetectionUnit.sv"
`include "../ForwardingUnit/ForwardingUnit.sv"
`include "../Registers/littleRegisters/FETCH/PC_fe.sv"
`include "../Registers/littleRegisters/DECODE/Inst_de.sv"
`include "../Registers/littleRegisters/DECODE/PC_de.sv"
`include "../Registers/littleRegisters/DECODE/PCInc_de.sv"
`include "../Registers/littleRegisters/EXECUTE/ImmExt_ex.sv"
`include "../Registers/littleRegisters/EXECUTE/PC_ex.sv"
`include "../Registers/littleRegisters/EXECUTE/PCInc_ex.sv"
`include "../Registers/littleRegisters/EXECUTE/rd_ex.sv"
`include "../Registers/littleRegisters/EXECUTE/rs1_ex.sv"
`include "../Registers/littleRegisters/EXECUTE/rs2_ex.sv"
`include "../Registers/littleRegisters/EXECUTE/RUrs1_ex.sv"
`include "../Registers/littleRegisters/EXECUTE/RUrs2_ex.sv"
`include "../Registers/littleRegisters/MEMORY/ALURes_me.sv"
`include "../Registers/littleRegisters/MEMORY/PCInc_me.sv"
`include "../Registers/littleRegisters/MEMORY/rd_me.sv"
`include "../Registers/littleRegisters/MEMORY/RUrs2_me.sv"
`include "../Registers/littleRegisters/WRITEBACK/ALURes_wb.sv"
`include "../Registers/littleRegisters/WRITEBACK/DMDataRd_wb.sv"
`include "../Registers/littleRegisters/WRITEBACK/PCInc_wb.sv"
`include "../Registers/littleRegisters/WRITEBACK/rd_wb.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/ALUASrc_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/ALUBSrc_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/ALUOP_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/BUOp_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/DMCtrl_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/DMRd_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/DMWr_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/RUDataWrSrc_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/EXECUTE/RUWr_ex.sv"
`include "../Registers/littleRegisters/ControlSignals/MEMORY/DMCtrl_me.sv"
`include "../Registers/littleRegisters/ControlSignals/MEMORY/DMWr_me.sv"
`include "../Registers/littleRegisters/ControlSignals/MEMORY/RUDataWrSrc_me.sv"
`include "../Registers/littleRegisters/ControlSignals/MEMORY/RUWr_me.sv"
`include "../Registers/littleRegisters/ControlSignals/WRITEBACK/RUDataWrSrc_wb.sv"
`include "../Registers/littleRegisters/ControlSignals/WRITEBACK/RUWr_wb.sv"

module Processor(
    input logic clk
);

    //pc_plus-4
    logic [31:0] pc_out_plus_4;

    //Instruction Memory
    logic [31:0] instruction;

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
    logic DMRd;

    //Registers Unit
    logic [4:0] rs1;
    logic [4:0] rs2;
    logic [4:0] rd;
    logic [31:0] DataWr;
    logic RUWr;
    logic [31:0] RURs1;
    logic [31:0] RURs2;

    //little registers
    
    //FETCH
    //PC_fe
    logic [31:0] pc_input;
    logic [31:0] pc_out;

    //DECODE
    //Inst_de
    logic [31:0] Inst_de_output;
    //PC_de
    logic [31:0] PC_de_output;
    //PCInc_de
    logic [31:0] PCInc_de_output;
    
    //EXECUTE
    logic [31:0] ImmExt_ex_output;
    logic [31:0] PC_ex_output;
    logic [31:0] PCInc_ex_output;
    logic [4:0] rd_ex_output;
    logic [4:0] rs1_ex_output;
    logic [4:0] rs2_ex_output;
    logic [31:0] RUrs1_ex_output;
    logic [31:0] RUrs2_ex_output;
    //EXECUTE ControlUnit
    logic ALUASrc_ex_output;
    logic ALUBSrc_ex_output;
    logic [3:0] ALUOp_ex_output;
    logic [4:0] BUOp_ex_output;
    logic DMRd_ex_output;
    logic [2:0] DMCtrl_ex_output;
    logic DMWr_ex_output;
    logic [1:0] RUDataWrSrc_ex_output;
    logic RUWr_ex_output;

    //MEMORY
    logic [31:0] ALURes_me_output;
    logic [31:0] PCInc_me_output;
    logic [4:0] rd_me_output;
    logic [31:0] RUrs2_me_output;
    //MEMORY ControlUnit
    logic [2:0] DMCtrl_me_output;
    logic DMWr_me_output;
    logic [1:0] RUDataWrSrc_me_output;
    logic RUWr_me_output;

    //WRITEBACK
    logic [1:0] RUDataWrSrc_wb_output;
    logic RUWr_wb_output;
    logic [31:0] DMDataRd_wb_input;
    logic [31:0] DMDataRd_wb_output;
    //WRITEBACK ControlUnit
    logic [31:0] ALURes_wb_output;
    logic [31:0] PCInc_wb_output;
    logic [4:0] rd_wb_output;
    logic [31:0] RUrs2_wb_output;

    //Hazard Detection Unit
    logic HDUStall;

    //Forwarding Unit
    logic [1:0] FUBSrc;
    logic [1:0] FUASrc;
    
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
    

    
/*    ProgramCounter PC(
        .clk(clk),
        .pc_input(pc_input),  // Inicializar pc_input en 0 solo una vez
        .pc_out(pc_out)
    );*/

    ProgramCounter PC_fe(
        .clk(clk),
        .pc_input(pc_input),  // Inicializar pc_input en 0 solo una vez
        .pc_out(pc_out)
    );

    // Instanciar el módulo InstructionMemory
    InstructionMemory IM(
        .address(pc_out),
        .instruction(instruction)
    );

    PCInc_de PCInc_de(
        .enable(HDUStall),
        .clrBU(NextPCSrc),
        .PCInc_de_input(pc_out_plus_4),
        .PCInc_de_output(PCInc_de_output)
    );

    PC_de PC_de(
        .enable(HDUStall),
        .clrBU(NextPCSrc),
        .PC_de_input(pc_out),
        .PC_de_output(PC_de_output)
    );

    Inst_de Inst_de(
        .enable(HDUStall),
        .clrBU(NextPCSrc),
        .Inst_de_input(instruction),
        .Inst_de_output(Inst_de_output)
    );

    // Extraer los bits 6 al 0 de la instrucción para el OpCode
    assign opcode = Inst_de_output[6:0];
    assign Funct3 = Inst_de_output[14:12];
    assign Funct7 = Inst_de_output[31:25];

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
        .RUDataWrSrc(RUDataWrSrc),
        .DMRd(DMRd)
        // Pasa otras entradas y salidas según sea necesario
    );

    assign rs1 = Inst_de_output[19:15];
    assign rs2 = Inst_de_output[24:20];
    assign rd = Inst_de_output[11:7];

    HazardDetectionUnit HDU(
        .rs1_de(rs1),
        .rs2_de(rs2),
        .rd_ex(rd_ex_output),
        .DMRd_ex(DMRd_ex),
        .HDUStall(HDUStall)
    );

    RegisterUnit RUnit(
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .DataWr(DataWr),
        .RUWr(RUWr_wb),
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

    //Execute Registers
    ALUASrc_ex ALUASrc_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .ALUASrc_ex_input(ALUASrc),
        .ALUASrc_ex_output(ALUASrc_ex_output)

    );

    ALUBSrc_ex ALUBSrc_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .ALUBSrc_ex_input(ALUBSrc),
        .ALUBSrc_ex_output(ALUBSrc_ex_output)
        
    );

    ALUOp_ex ALUOP_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .ALUOp_ex_input(ALUOp),
        .ALUOp_ex_output(ALUOp_ex_output)
        
    );

    BUOp_ex BUOp_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .BUOp_ex_input(BrOp),
        .BUOp_ex_output(BUOp_ex_output)
        
    );

    DMCtrl_ex DMCtrl_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .DMCtrl_ex_input(DMCtrl),
        .DMCtrl_ex_output(DMCtrl_ex_output)
        
    );

    DMRd_ex DMRd_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .DMRd_ex_input(DMRd_ex),
        .DMRd_ex_output(DMRd_ex_output)
        
    );

    DMWr_ex DMWr_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .DMWr_ex_input(DMWr),
        .DMWr_ex_output(DMWr_ex_output)
        
    );

    RUDataWrSrc_ex RUDataWrSrc_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .RUDataWrSrc_ex_input(RUDataWrSrc),
        .RUDataWrSrc_ex_output(RUDataWrSrc_ex_output)
        
    );

    RUWr_ex RUWr_ex(
        .clk(clk),
        .clrHDU(HDUStall),
        .clrBU(NextPCSrc),
        .RUWr_ex_input(RUWr),
        .RUWr_ex_output(RUWr_ex_output)
        
    );

    ImmExt_ex ImmExt_ex(
        .clk(clk),
        .ImmExt_ex_input(ImmExt),
        .ImmExt_ex_output(ImmExt_ex_output)
    );

    PCInc_ex PCInc_ex(
        .clk(clk),
        .PCInc_ex_input(PCInc_de_output),
        .PCInc_ex_output(PCInc_ex_output)
    );

    PC_ex PC_ex(
        .clk(clk),
        .PC_ex_input(PC_de_output),
        .PC_ex_output(PC_ex_output)
    );

    RUrs1_ex RUrs1_ex(
        .clk(clk),
        .RUrs1_ex_input(RURs1),
        .RUrs1_ex_output(RUrs1_ex_output)
    );

    RUrs2_ex RUrs2_ex(
        .clk(clk),
        .RUrs2_ex_input(RURs2),
        .RUrs2_ex_output(RUrs2_ex_output)
    );

    rd_ex rd_ex(
        .clk(clk),
        .rd_ex_input(rd),
        .rd_ex_output(rd_ex_output)
    );

    rs1_ex rs1_ex(
        .clk(clk),
        .rs1_ex_input(rs1),
        .rs1_ex_output(rs1_ex_output)
    );

    rs2_ex rs2_ex(
        .clk(clk),
        .rs2_ex_input(rs2),
        .rs2_ex_output(rs2_ex_output)
    );
    //end Execute Registers

    BranchUnit BU(
        .RURs1(RUrs1_ex_output),
        .RURs2(RUrs2_ex_output),
        .BrOp(BUOp_ex_output),
        .NextPCSrc(NextPCSrc)
    );

    ForwardingUnit FU(
        .rs1_ex(rs1_ex_output),
        .rs2_ex(rs2_ex_output),
        .RUWr_me(RUWr_me_output),
        .RUWr_wb(RUWr_wb_output),
        .rd_me(rd_me_output),
        .rd_wb(rd_wb_output),
        .FUASrc(FUASrc),
        .FUBSrc(FUBSrc)
    );

    always @* begin
        pc_out_plus_4 = pc_out + 4;

        if (FUASrc == 2'b11) begin
            RUrs1_ex_output <= DataWr;
        end else if (FUASrc == 2'b10) begin
            RUrs1_ex_output <= ALURes_me_output;
            end else if (FUASrc == 2'b00) begin
                RUrs1_ex_output <= RUrs1_ex_output;
                end

        if (FUBSrc == 2'b11) begin
            RUrs2_ex_output <= DataWr;
        end else if (FUBSrc == 2'b10) begin
            RUrs2_ex_output <= ALURes_me_output;
            end else if (FUBSrc == 2'b00) begin
                RUrs2_ex_output <= RUrs2_ex_output;
                end

        if (ALUASrc_ex_output) begin
            A <= PC_ex_output;
        end else begin
            A <= RUrs1_ex_output;
        end

        if (ALUBSrc_ex_output) begin
            B <= ImmExt_ex_output;
        end else begin
            B <= RUrs2_ex_output;
        end

        if (NextPCSrc) begin
            pc_input <= S;
        end else begin
            pc_input <= pc_out_plus_4;
        end

        if (RUDataWrSrc_wb_output == 2'b10) begin
            DataWr <= PCInc_wb_output;
        end else if (RUDataWrSrc_wb_output == 2'b01) begin
            DataWr <= DMDataRd_wb_output;
            end else if (RUDataWrSrc_wb_output == 2'b00) begin
                DataWr <= ALURes_wb_output;
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
        .AluOp(ALUOp_ex_output),
        .S(S)
    );

    //MEMORY registers
    //Control Signals
    DMCtrl_me DMCtrl_me(
        .clk(clk),
        .DMCtrl_me_input(DMCtrl_ex_output),
        .DMCtrl_me_output(DMCtrl_me_output)
    );

    DMWr_me DMWr_me(
        .clk(clk),
        .DMWr_me_input(DMWr_ex_output),
        .DMWr_me_output(DMWr_me_output)
    );

    RUDataWrSrc_me RUDataWrSrc_me(
        .clk(clk),
        .RUDataWrSrc_me_input(RUDataWrSrc_ex_output),
        .RUDataWrSrc_me_output(RUDataWrSrc_me_output)
    );

    RUWr_me RUWr_me(
        .clk(clk),
        .RUWr_me_input(RUWr_ex_output),
        .RUWr_me_output(RUWr_me_output)
    );
    //end Control MEMORY signals

    PCInc_me PCInc_me(
        .clk(clk),
        .PCInc_me_input(PCInc_ex_output),
        .PCInc_me_output(PCInc_me_output)
    );

    ALURes_me ALURes_me(
        .clk(clk),
        .ALURes_me_input(S),
        .ALURes_me_output(ALURes_me_output)
    );

    RUrs2_me RUrs2_me(
        .clk(clk),
        .RUrs2_me_input(RUrs2_ex_output),
        .RUrs2_me_output(RUrs2_me_output)
    );

    rd_me rd_me(
        .clk(clk),
        .rd_me_input(rd_ex_output),
        .rd_me_output(rd_me_output)
    );
    
    DataMemory DM(
        .Address(ALURes_me_output),
        .DataWr(RUrs2_me_output),
        .DMWr(DMWr_me_output),
        .DMCtrl(DMCtrl_me_output),
        .DataRd(DataRd)
    );

    //WRITEBACK Registers
    RUDataWrSrc_wb RUDataWrSrc_wb(
        .clk(clk),
        .RUDataWrSrc_wb_input(RUDataWrSrc_ex_output),
        .RUDataWrSrc_wb_output(RUDataWrSrc_wb_output)
    );

    RUWr_wb RUWr_wb(
        .clk(clk),
        .RUWr_wb_input(RUWr_ex_output),
        .RUWr_wb_output(RUWr_wb_output)
    );

    rd_wb rd_wb(
        .clk(clk),
        .rd_wb_input(rd_me_output),
        .rd_wb_output(rd_wb_output)
    );

    PCInc_wb PCInc_wb(
        .clk(clk),
        .PCInc_wb_input(PCInc_me_output),
        .PCInc_wb_output(PCInc_wb_output)
    );

    DMDataRd_wb DMDataRd_wb(
        .clk(clk),
        .DMDataRd_wb_input(DataRd),
        .DMDataRd_wb_output(DMDataRd_wb_output)
    );

    ALURes_wb ALURes_wb(
        .clk(clk),
        .ALURes_wb_input(ALURes_me_output),
        .ALURes_wb_output(ALURes_wb_output)
    );
    //End WRITEBACK registers
    


endmodule
