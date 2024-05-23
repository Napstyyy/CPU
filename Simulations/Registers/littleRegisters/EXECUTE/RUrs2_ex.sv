module RUrs2_ex(
    input wire clk,
    input logic [31:0] RUrs2_ex_input,
    output logic [31:0] RUrs2_ex_output
);

    always_ff @(posedge clk) begin
        RUrs2_ex_output <= RUrs2_ex_input
    end

endmodule
