module RUDataWrSrc_me(
    input wire clk,
    input logic [1:0] RUDataWrSrc_me_input,
    output logic [1:0] RUDataWrSrc_me_output
);

    always_ff @(posedge clk) begin
       RUDataWrSrc_me_output <= RUDataWrSrc_me_input
    end

endmodule
