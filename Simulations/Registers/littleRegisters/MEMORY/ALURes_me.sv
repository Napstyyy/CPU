module ALURes_me(
    input wire clk,
    input logic [31:0] ALURes_me_input,
    output logic [31:0] ALURes_me_output
);

    always_ff @(posedge clk) begin
        ALURes_me_output <= ALURes_me_input
    end

endmodule
