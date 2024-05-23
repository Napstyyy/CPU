module RUrs2_me(
    input wire clk,
    input logic [31:0] RUrs2_me_input,
    output logic [31:0] RUrs2_me_output
);

    always_ff @(posedge clk) begin
        RUrs2_me_output <= RUrs2_me_input
    end

endmodule
