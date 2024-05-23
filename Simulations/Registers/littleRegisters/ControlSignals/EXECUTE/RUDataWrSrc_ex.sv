module RUDataWrSrc_ex(
    input wire clk,
    input logic [1:0] RUDataWrSrc_ex_input,
    output logic [1:0] RUDataWrSrc_ex_output
);

    always_ff @(posedge clk) begin
       RUDataWrSrc_ex_output <= RUDataWrSrc_ex_input
    end

endmodule
