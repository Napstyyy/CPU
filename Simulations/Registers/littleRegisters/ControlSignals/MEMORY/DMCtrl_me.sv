module DMCtrl_me(
    input wire clk,
    input logic [2:0] DMCtrl_me_input,
    output logic [2:0] DMCtrl_me_output
);

    always_ff @(posedge clk) begin
       DMCtrl_me_output <= DMCtrl_me_input
    end

endmodule
