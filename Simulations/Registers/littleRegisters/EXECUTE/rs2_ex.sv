module rs2_ex(
    input wire clk,
    input logic [4:0] rs2_ex_input,
    output logic [4:0] rs2_ex_output
);

    always_ff @(posedge clk) begin
        rs2_ex_output <= rs2_ex_input
    end

endmodule
