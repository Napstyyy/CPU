module rd_me(
    input wire clk,
    input logic [4:0] rd_me_input,
    output logic [4:0] rd_me_output
);

    always_ff @(posedge clk) begin
        rd_me_output <= rd_me_input
    end

endmodule
