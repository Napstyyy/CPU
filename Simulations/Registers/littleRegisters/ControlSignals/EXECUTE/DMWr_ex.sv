module DMWr_ex(
    input wire clk,
    input logic DMWr_ex_input,
    output logic DMWr_ex_output
);

    always_ff @(posedge clk) begin
       DMWr_ex_output <= DMWr_ex_input
    end

endmodule
