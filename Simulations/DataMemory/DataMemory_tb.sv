`timescale 1ns / 1ps

module DataMemory_tb;

  reg [31:0] Address;
  reg [31:0] DataWr;
  reg DMWr;
  reg [2:0] DMCtrl;
  wire [31:0] DataRd;

  DataMemory dut (
    .Address(Address),
    .DataWr(DataWr),
    .DMWr(DMWr),
    .DMCtrl(DMCtrl),
    .DataRd(DataRd)
  );

  initial begin
    $dumpfile("DataMemory_tb.vcd");
    $dumpvars(0, DataMemory_tb);


    // Test 2: Write to memory
    Address = 12;
    DataWr = 32'b1111111111111100;
    DMCtrl = 3'b010; // Word
    DMWr = 1;
    #10;
    DMWr = 0;
    #10;
    // Test 1: Read from memory
    Address = 12;
    DMCtrl = 3'b010; // Word
    DataWr = 32'h00000000;
    #10;

    // Add more tests as needed
    $finish;
  end

endmodule
