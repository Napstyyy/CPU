module ALU_Tb();
  logic [3:0] A, B; 
  logic [1:0] ALUOP; 
  logic [3:0] S; 

  ALU ALU1(
    .A(A),
    .B(B),
    .ALUOP(ALUOP),
    .S(S)
  );
  
  integer i = 0;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, ALU_Tb);
      A = 4'b1010;
      B = 4'b10;
      ALUOP = 2'b00;

      for (i = 0; i < 4; i = i + 1)
        begin
          ALUOP = i;
          #1;
        end

      $finish;
  end
endmodule