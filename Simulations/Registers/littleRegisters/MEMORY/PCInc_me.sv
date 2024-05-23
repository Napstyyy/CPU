module PCInc_me(
    input wire clk,
    input logic [31:0] PCInc_me_input,
    output logic [31:0] PCInc_me_output
);

    always_ff @(posedge clk) begin
        PCInc_me_output <= PCInc_me_input
    end

endmodule
