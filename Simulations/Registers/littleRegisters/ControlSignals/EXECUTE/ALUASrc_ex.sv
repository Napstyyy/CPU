module ALUASrc_ex(
    input wire clk,
    input logic ALUASrc_ex_input,
    input logic clrHDU,
    input logic clrBU,
    output logic ALUASrc_ex_output
);

    always_ff @(posedge clk) begin
        if (clrHDU || clrBU) begin
            ALUASrc_ex_output <= 1'b0;  // Limpieza del registro
        end else begin
            ALUASrc_ex_output <= ALUASrc_ex_input;
        end
    end

endmodule
