module ALURes_wb(
    input wire clk,
    input logic [31:0] ALURes_wb_input,
    output logic [31:0] ALURes_wb_output
);

    always_ff @(posedge clk) begin
        ALURes_wb_output <= ALURes_wb_input
    end

endmodule
