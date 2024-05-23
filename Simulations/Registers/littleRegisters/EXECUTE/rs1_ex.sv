module rs1_ex(
    input wire clk,
    input logic [4:0] rs1_ex_input,
    output logic [4:0] rs1_ex_output
);

    always_ff @(posedge clk) begin
        rs1_ex_output <= rs1_ex_input
    end

endmodule
