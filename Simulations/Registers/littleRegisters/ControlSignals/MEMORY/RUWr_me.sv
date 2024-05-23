module RUWr_me(
    input wire clk,
    input logic RUWr_me_input,
    output logic RUWr_me_output
);

    always_ff @(posedge clk) begin
       RUWr_me_output <= RUWr_me_input
    end

endmodule
