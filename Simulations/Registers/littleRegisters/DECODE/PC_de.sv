module PC_de(
    input wire clk,
    input logic [31:0] PC_de_input,
    input wire enable,
    input wire clrBU,
    output logic [31:0] PC_de_output
);

    always_ff @(posedge clk) begin
        if (clrBU) begin
            PC_de_output <= 32'b0; // Limpiar el registro si clrBU está activo
        end else if (!enable) begin
                    PC_de_output <= PC_de_input //!enable = activo bajo
                end
    end

endmodule
