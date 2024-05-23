module DMWr_me(
    input wire clk,
    input logic DMWr_me_input,
    output logic DMWr_me_output
);

    always_ff @(posedge clk) begin
       DMWr_me_output <= DMWr_me_input
    end

endmodule
