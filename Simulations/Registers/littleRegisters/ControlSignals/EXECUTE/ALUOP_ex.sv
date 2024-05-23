module ALUOp_ex(
    input wire clk,
    input logic [3:0] ALUOp_ex_input,
    input logic clrHDU,
    input logic clrBU,
    output logic [3:0] ALUOp_ex_output
);

    always_ff @(posedge clk) begin
        if (clrHDU || clrBU) begin
            ALUOp_ex_output <= 4'b0000;  // Limpieza del registro
        end else begin
            ALUOp_ex_output <= ALUOp_ex_input;
        end
    end

endmodule
