module ALUBSrc_ex(
    input wire clk,
    input logic ALUBSrc_ex_input,
    input logic clrHDU,
    input logic clrBU,
    output logic ALUBSrc_ex_output
);

    always_ff @(posedge clk) begin
        if (clrHDU || clrBU) begin
            ALUBSrc_ex_output <= 1'b0;  // Limpieza del registro
        end else begin
            ALUBSrc_ex_output <= ALUBSrc_ex_input;
        end
    end

endmodule
