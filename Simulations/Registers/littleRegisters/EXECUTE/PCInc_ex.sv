module PCInc_ex(
    input wire clk,
    input logic [31:0] PCInc_ex_input,
    output logic [31:0] PCInc_ex_output
);

    always_ff @(posedge clk) begin
        PCInc_ex_output <= PCInc_ex_input
    end

endmodule
