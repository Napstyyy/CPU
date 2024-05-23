module DMRd_ex(
    input wire clk,
    input logic DMRd_ex_input,
    input logic clrHDU,
    input logic clrBU,
    output logic DMRd_ex_output
);

    always_ff @(posedge clk) begin
        if (clrHDU || clrBU) begin
            DMRd_ex_output <= 1'b0;  // Limpieza del registro
        end else begin
            DMRd_ex_output <= DMRd_ex_input;
        end
    end

endmodule
