module ProgramCounter (
    input wire clk,
    input logic [31:0] pc_input,
    output logic [31:0] pc_out
);

    logic first_time = 1'b1;

    always_ff @(posedge clk) begin
        if (first_time) begin
            pc_out <= 32'h00000000;
            first_time <= 1'b0;
        end else begin
            pc_out <= pc_input;
        end
    end

endmodule
