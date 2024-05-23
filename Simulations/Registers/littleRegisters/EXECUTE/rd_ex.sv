module rd_ex(
    input wire clk,
    input logic [4:0] rd_ex_input,
    output logic [4:0] rd_ex_output
);

    always_ff @(posedge clk) begin
        rd_ex_output <= rd_ex_input
    end

endmodule
