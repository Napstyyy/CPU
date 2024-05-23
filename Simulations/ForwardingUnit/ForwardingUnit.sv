module ForwardingUnit(
    input logic [4:0] rs1_ex,
    input logic [4:0] rs2_ex,
    input logic [4:0] rd_me,
    input logic RUWr_me,
    input logic RUWr_wb,
    input logic [4:0] rd_wb,
    output logic [1:0] FUASrc,
    output logic [1:0] FUBSrc
);

    always_comb begin
        if (RUWr_me == 1 && rd_me == rs1_ex)
            FUASrc = 2'b10;
        else
            if (RUWr_wb == 1 && rd_wb == rs1_ex)
                FUASrc = 2'b11;
            else 
                FUASrc = 2'b00;

        if (RUWr_me == 1 && rd_me == rs2_ex)
            FUBSrc = 2'b10;
        else
            if (RUWr_wb == 1 && rd_wb == rs2_ex)
                FUBSrc = 2'b11;
            else 
                FUBSrc = 2'b00;

    end

endmodule
