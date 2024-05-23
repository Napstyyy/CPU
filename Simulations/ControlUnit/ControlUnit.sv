module ControlUnit (
    input logic [6:0] opcode,
    input logic [2:0] Funct3,
    input logic [6:0] Funct7,
    output logic RUWr,
    output logic [3:0] ALUOp,
    output logic [2:0] ImmSrc,
    output logic ALUASrc,
    output logic ALUBSrc,
    output logic DMWr,
    output logic [2:0] DMCtrl,
    output logic [4:0] BrOp,
    output logic [1:0] RUDataWrSrc,
    output logic DMRd_ex
);
always @* begin
    if (opcode == 7'b0110011 || opcode == 7'b0010011 || opcode == 7'b0000011) begin
        RUWr = 1'b1;
        if (opcode == 7'b0110011) begin
                 ALUOp = {Funct7[5], Funct3};
            end
                else if (opcode == 7'b0010011) begin
                    if(Funct3 == 3'b001 || Funct3 == 3'b101) begin
                        ALUOp = {Funct7[5], Funct3};
                    end
                    else begin
                        ALUOp = {1'b0, Funct3};
                    end
                end
                    else begin
                        ALUOp = 4'b0000;
                        DMRd_ex = 1'b1;
                    end
        ImmSrc = 3'b000;
        ALUASrc = 1'b0;
        ALUBSrc = ~opcode[5];
        DMWr = 1'b0;
        DMCtrl = Funct3;
        BrOp = 5'b00000;
        RUDataWrSrc = {1'b0, ~opcode[4]};
    end
    else if (opcode == 7'b1100011 || opcode == 7'b1101111 || opcode == 7'b0100011) begin
        RUWr = opcode[3];
        ALUOp = 4'b0000;
        ALUASrc = opcode[6];
        ALUBSrc = 1'b1;
        DMWr = ~opcode[6];
        DMCtrl = Funct3;
        if (opcode == 7'b1100011) begin
            ImmSrc = 3'b101;
            BrOp = {2'b01, Funct3};
        end
            else if (opcode == 7'b1101111) begin
                ImmSrc = 3'b110;
                BrOp = 5'b10000;
            end
                else begin
                    ImmSrc = 3'b001;
                        BrOp = 5'b00000;
                end
        RUDataWrSrc = 2'b10;
    end
    else if (opcode == 7'b1100111 || opcode == 7'b0110111) begin
        RUWr = opcode[6];
        ALUOp = (opcode == 7'b1100111) ? 4'b0000 : 4'b0111;
        ImmSrc = (opcode == 7'b1100111) ? 3'b000 : 3'b010;
        ALUASrc = 1'b0;
        ALUBSrc = 1'b1;
        DMWr = 1'b0;
        DMCtrl = 3'b000;
        BrOp = (opcode == 7'b1100111) ? 5'b10000 : 5'b00000;
        RUDataWrSrc = (opcode == 7'b1100111) ? 2'b10 : 2'b00;
    end
    else begin
        RUWr = 1'b0;
        ALUOp = 1'b0;
        ImmSrc = 1'b0;
        ALUASrc = 1'b0;
        ALUBSrc = 1'b0;
        DMWr = 1'b0;
        DMCtrl = 1'b0;
        BrOp = 1'b0;
        RUDataWrSrc = 1'b0;
    end
end

endmodule
