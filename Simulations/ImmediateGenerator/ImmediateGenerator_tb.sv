module ImmediateGenerator_tb;

  // Parámetros
  parameter WIDTH = 25; // Ancho de la instrucción
  
  // Señales
  reg [WIDTH-1:0] Inst;
  reg [2:0] ImmSrc;
  wire [31:0] ImmExt;
  
  // Instancia del módulo ImmediateGenerator
  ImmediateGenerator dut (
    .Inst(Inst),
    .ImmSrc(ImmSrc),
    .ImmExt(ImmExt)
  );
  
  // Generación de estímulos
  initial begin
    // Abre el archivo VCD
    $dumpfile("ImmediateGenerator_tb.vcd");
    $dumpvars(0, ImmediateGenerator_tb);
    
    // Inicializa las señales
    Inst = 0;
    ImmSrc = 0;
    
    // Prueba de ImmSrc = 3'b000
    Inst = 25'b0000000010100000000001000; // Ejemplo de instrucción
    ImmSrc = 3'b000;
    #10;
    
    // Fin de la simulación
    $finish;
  end

endmodule
