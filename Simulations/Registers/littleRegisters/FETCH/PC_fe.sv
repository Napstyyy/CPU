module PC_fe(
    input wire clk,
    input wire enable,
    input logic [31:0] pc_input,
    output logic [31:0] pc_out
);

    logic first_time = 1'b1;

    always_ff @(posedge clk) begin
        if (first_time) begin
            pc_out <= 32'h00000000;
            first_time <= 1'b0;
        end else if (!enable) begin //!enable = activo bajo
            pc_out <= pc_input;
        end
        // Si enable es 0, no se hace nada y pc_out mantiene su valor anterior
    end

endmodule
