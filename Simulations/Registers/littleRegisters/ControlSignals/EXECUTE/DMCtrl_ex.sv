module DMCtrl_ex(
    input wire clk,
    input logic [2:0] DMCtrl_ex_input,
    output logic [2:0] DMCtrl_ex_output
);

    always_ff @(posedge clk) begin
       DMCtrl_ex_output <= DMCtrl_ex_input
    end

endmodule
