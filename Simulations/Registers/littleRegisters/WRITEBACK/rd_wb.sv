module rd_wb(
    input wire clk,
    input logic [4:0] rd_wb_input,
    output logic [4:0] rd_wb_output
);

    always_ff @(posedge clk) begin
        rd_wb_output <= rd_wb_input
    end

endmodule
