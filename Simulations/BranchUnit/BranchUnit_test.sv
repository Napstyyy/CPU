module BranchUnit_tb;

  // Señales de entrada
  reg [31:0] RURs1, RURs2;
  reg [4:0] BrOp;

  // Señal de salida
  wire NextPCSrc;

  // Instancia del módulo BranchUnit
  BranchUnit dut (
    .RURs1(RURs1),
    .RURs2(RURs2),
    .BrOp(BrOp),
    .NextPCSrc(NextPCSrc)
  );

  // Inicialización de la simulación
  initial begin
    // Abrir el archivo VCD
    $dumpfile("BranchUnit_tb.vcd");
    $dumpvars(0, BranchUnit_tb);

    // Inicializar las señales
    RURs1 = 32'd0;
    RURs2 = 32'd0;
    BrOp = 5'b00000;

    // Esperar un tiempo antes de comenzar la prueba
    #10;

    // Iniciar la secuencia de prueba
    // Prueba 1: BrOp[4] = 1
    BrOp = 5'b10000;
    #10;

    // Prueba 2: BrOp[4:3] = 00
    BrOp = 5'b00000;
    #10;

    // Prueba 3: BrOp[4:3] = 01, BrOp[2:0] = 000 (RURs1 == RURs2)
    BrOp = 5'b01000;
    RURs1 = 32'd10;
    RURs2 = 32'd10;
    #10;

    // Puedes agregar más secuencias de prueba aquí

    // Terminar la simulación
    $finish;
  end

endmodule
