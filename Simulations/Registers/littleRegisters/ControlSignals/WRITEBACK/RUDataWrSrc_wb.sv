module RUDataWrSrc_wb(
    input wire clk,
    input logic [1:0] RUDataWrSrc_wb_input,
    output logic [1:0] RUDataWrSrc_wb_output
);

    always_ff @(posedge clk) begin
       RUDataWrSrc_wb_output <= RUDataWrSrc_wb_input
    end

endmodule
