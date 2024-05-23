module PCInc_de(
    input wire clk,
    input logic [31:0] PCInc_de_input,
    input wire enable,
    input wire clrBU,
    output logic [31:0] PCInc_de_output
);

    always_ff @(posedge clk) begin
        if (clrBU) begin
            PC_de_output <= 32'b0; // Limpiar el registro si clrBU está activo
        end else if (!enable) begin //!enable = activo bajo
                    PCInc_de_output <= PCInc_de_input
                end
    end

endmodule
