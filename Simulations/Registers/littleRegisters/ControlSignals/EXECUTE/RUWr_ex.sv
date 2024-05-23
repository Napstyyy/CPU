module RUWr_ex(
    input wire clk,
    input logic RUWr_ex_input,
    output logic RUWr_ex_output
);

    always_ff @(posedge clk) begin
       RUWr_ex_output <= RUWr_ex_input
    end

endmodule
