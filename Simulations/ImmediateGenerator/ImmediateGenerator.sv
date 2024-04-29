module ImmediateGenerator (
    input logic [24:0] Inst,
    input logic [2:0] ImmSrc,
    output logic [31:0] ImmExt
);

    always @* begin
        case (ImmSrc)
            3'b000: ImmExt = { {20{Inst[24]}}, Inst[24:13]};
            3'b001: ImmExt = { {20{Inst[24]}}, Inst[24:18], Inst[4:0]};
            3'b101: ImmExt = { {19{Inst[24]}}, Inst[24], Inst[0], Inst[23:18], Inst[4:1], 1'b0};
            3'b010: ImmExt = { {12{Inst[24]}}, Inst[24:5]};
            3'b110: ImmExt = { {11{Inst[24]}}, Inst[24], Inst[12:5], Inst[13], Inst[23:14], 1'b0};
            default: ImmExt = 32'h00000000;
        endcase
    end

endmodule
