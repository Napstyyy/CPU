module PCInc_wb(
    input wire clk,
    input logic [31:0] PCInc_wb_input,
    output logic [31:0] PCInc_wb_output
);

    always_ff @(posedge clk) begin
        PCInc_wb_output <= PCInc_wb_input
    end

endmodule
