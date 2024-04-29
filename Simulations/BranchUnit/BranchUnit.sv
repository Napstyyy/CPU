module BranchUnit (
    input logic [31:0] RURs1,
    input logic [31:0] RURs2,
    input logic [4:0] BrOp,
    output logic NextPCSrc
);

    always @* begin
        if (BrOp[4] == 1) NextPCSrc <= 1;
        else if (BrOp[4] == 0 && BrOp[3] == 0) NextPCSrc <= 0;
        else if (BrOp[4] == 0 && BrOp[3] == 1) begin
            if (BrOp[2:0] == 3'b000) NextPCSrc <= RURs1 == RURs2;
            else if (BrOp[2:0] == 3'b001) NextPCSrc <= RURs1 != RURs2;
            else if (BrOp[2:0] == 3'b100) NextPCSrc <= $signed(RURs1) < $signed(RURs2);
            else if (BrOp[2:0] == 3'b101) NextPCSrc <= $signed(RURs1) >= $signed(RURs2);
            else if (BrOp[2:0] == 3'b110) NextPCSrc <= RURs1 < RURs2;
            else if (BrOp[2:0] == 3'b111) NextPCSrc <= RURs1 >= RURs2; 
        end

    end

endmodule
