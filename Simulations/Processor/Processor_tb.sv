module Processor_tb;

  logic clk;
  logic [31:0] pc_input, pc_output, instruction, rs1, rs2;

  // Instantiate the DUT (Processor)
  Processor dut (
    .clk(clk)
    // Connect other ports here
  );

  // Assign signals from DUT to testbench signals
  assign pc_input = dut.pc_input;
  assign pc_output = dut.pc_out;
  assign instruction = dut.instruction;
  assign rs1 = dut.rs1;
  assign rs2 = dut.rs2;

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Display values of rs1 and rs2 on every positive clock edge
  always @(posedge clk) begin
    $display("rs1 %h rs2 %h", rs1, rs2);
  end

  // Dump VCD file and finish simulation after some time
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Processor_tb);
    #4000;
    $finish;
  end

endmodule
