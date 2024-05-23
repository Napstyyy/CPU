module RUrs1_ex(
    input wire clk,
    input logic [31:0] RUrs1_ex_input,
    output logic [31:0] RUrs1_ex_output
);

    always_ff @(posedge clk) begin
        RUrs1_ex_output <= RUrs1_ex_input
    end

endmodule
