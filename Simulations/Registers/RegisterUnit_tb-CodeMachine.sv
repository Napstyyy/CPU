module RegisterUnit_tb;

  // Parámetros de simulación
  parameter CLK_PERIOD = 10; // Periodo del reloj en unidades de tiempo de simulación

  // Señales de entrada
  reg clk = 0;
  reg [4:0] rs1, rs2, rd;
  reg [31:0] DataWr;
  reg RUWr;

  // Señales de salida
  wire [31:0] RURs1, RURs2;

  // Instancia del módulo RegisterUnit
  RegisterUnit dut (
    .clk(clk),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .DataWr(DataWr),
    .RUWr(RUWr),
    .RURs1(RURs1),
    .RURs2(RURs2)
  );

  // Inicialización de la simulación
  initial begin
    // Abrir el archivo VCD
    $dumpfile("RegisterUnit_tb.vcd");
    $dumpvars(0, RegisterUnit_tb);

    // Inicializar las señales
    clk = 0;
    rs1 = 5'd0;
    rs2 = 5'd0;
    rd = 5'd0;
    DataWr = 32'd0;
    RUWr = 0;

    // Esperar un ciclo de reloj antes de comenzar la prueba
    #CLK_PERIOD;

    // Iniciar la secuencia de prueba
    // Ejemplo: escribir un valor en el registro rd = 5
    RUWr = 1;
    rd = 5;
    DataWr = 32'd1234;
    #CLK_PERIOD;
    RUWr = 0;
    #CLK_PERIOD;


    // Terminar la simulación
    $finish;
  end

  // Generador de reloj
  always #((CLK_PERIOD / 2)) clk = ~clk;

endmodule