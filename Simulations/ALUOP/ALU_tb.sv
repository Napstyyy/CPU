module ALU_tb;

  // Parámetros
  parameter WIDTH = 32; // Ancho de los operandos
  
  // Señales
  reg [WIDTH-1:0] A, B;
  reg [3:0] AluOp;
  wire [WIDTH-1:0] S;
  
  // Instancia del módulo ALU
  ALU dut (
    .A(A),
    .B(B),
    .AluOp(AluOp),
    .S(S)
  );
  
  // Generación de estímulos
  initial begin
    // Abre el archivo VCD
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, ALU_tb);
    
    // Inicializa las señales
    A = 0;
    B = 0;
    AluOp = 0;
    
    // Prueba de suma (AluOp = 4'b0000)
    A = 8;
    B = 4;
    AluOp = 4'b0000;
    #10;
    
    // Prueba de resta (AluOp = 4'b1000)
    A = 8;
    B = 4;
    AluOp = 4'b1000;
    #10;
    
    // Puedes añadir más casos de prueba aquí para las otras operaciones
    // Por ejemplo:
    // Prueba de desplazamiento a la izquierda (AluOp = 4'b0001)
    // Prueba de comparación (AluOp = 4'b0010)
    // Prueba de XOR (AluOp = 4'b0100)
    // Prueba de desplazamiento a la derecha (AluOp = 4'b0101)
    // ... y así sucesivamente
    
    // Fin de la simulación
    $finish;
  end

endmodule
