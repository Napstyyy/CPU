module PC_ex(
    input wire clk,
    input logic [31:0] PC_ex_input,
    output logic [31:0] PC_ex_output
);

    always_ff @(posedge clk) begin
        PC_ex_output <= PC_ex_input
    end

endmodule
