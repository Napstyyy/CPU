module ProgramCounter (
    input wire clk,
    input logic [31:0] pc_input,
    output logic [31:0] pc_out
);

    logic first_time = 1'b1; // Variable para controlar la primera vez

    always_ff @(posedge clk) begin
        if (first_time) begin
            pc_out <= 32'h00000000; // Si es la primera vez, establece pc_out en 0
            first_time <= 1'b0; // Desactiva la señal de primera vez
        end else begin
            pc_out <= pc_input; // De lo contrario, sigue pc_input
        end
    end

endmodule
