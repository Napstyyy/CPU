module RUWr_wb(
    input wire clk,
    input logic RUWr_wb_input,
    output logic RUWr_wb_output
);

    always_ff @(posedge clk) begin
       RUWr_wb_output <= RUWr_wb_input
    end

endmodule
