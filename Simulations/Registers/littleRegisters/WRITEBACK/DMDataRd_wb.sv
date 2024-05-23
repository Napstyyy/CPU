module DMDataRd_wb(
    input wire clk,
    input logic [31:0] DMDataRd_wb_input,
    output logic [31:0] DMDataRd_wb_output
);

    always_ff @(posedge clk) begin
        DMDataRd_wb_output <= DMDataRd_wb_input
    end

endmodule
