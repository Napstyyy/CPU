module ImmExt_ex(
    input wire clk,
    input logic [31:0] ImmExt_ex_input,
    output logic [31:0] ImmExt_ex_output
);

    always_ff @(posedge clk) begin
        ImmExt_ex_output <= ImmExt_ex_input
    end

endmodule
