module BUOp_ex(
    input wire clk,
    input logic [4:0] BUOp_ex_input,
    input logic clrHDU,
    input logic clrBU,
    output logic [4:0] BUOp_ex_output
);

    always_ff @(posedge clk) begin
        if (clrHDU || clrBU) begin
            BUOp_ex_output <= 5'b00000;  // Limpieza del registro
        end else begin
            BUOp_ex_output <= BUOp_ex_input;
        end
    end

endmodule
