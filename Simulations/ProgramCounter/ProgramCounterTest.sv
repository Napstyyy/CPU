`timescale 1ns/1ns

module ProgramCounter_tb;

    // Parámetros del módulo
    localparam CLK_PERIOD = 10;  // Período del reloj en unidades de tiempo (en este caso, 10ns)
    localparam SIM_TIME = 200;   // Tiempo total de simulación en unidades de tiempo

    // Señales del test bench
    reg clk = 0;                // Señal de reloj
    reg [31:0] pc_input = 0;    // Señal de entrada pc_input
    wire [31:0] pc_out;         // Señal de salida pc_out

    // Instanciación del módulo bajo prueba
    ProgramCounter dut (
        .clk(clk),
        .pc_input(pc_input),
        .pc_out(pc_out)
    );

    // Generación del reloj
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Generación del archivo VCD
    initial begin
        $dumpfile("ProgramCounter_tb.vcd");
        $dumpvars(0, ProgramCounter_tb);
    end

    // Cambio de pc_input para observar el cambio en pc_out
    initial begin
        // Inicialización
        // Cambios en pc_input
        #0   pc_input = 32'h00000000;
        #10  pc_input = 32'h00000001;
        #10  pc_input = 32'h00000002;
        #10  pc_input = 32'h00000003;
        #10  pc_input = 32'h00000004;
        #10  pc_input = 32'h00000005;
        #10  pc_input = 32'h00000006;
        #10  pc_input = 32'h00000007;
        #10  pc_input = 32'h00000008;
        #10  pc_input = 32'h00000009;
        #10  pc_input = 32'h0000000A;
        #10  pc_input = 32'h0000000B;
        #10  pc_input = 32'h0000000C;
        #10  pc_input = 32'h0000000D;
        #10  pc_input = 32'h0000000E;
        #10  pc_input = 32'h0000000F;
        $finish;
    end

    // Finalización de la simulación
    always @(posedge clk) begin
        if ($time == SIM_TIME) begin
            $display("Fin de la simulación.");
            $finish;
        end
    end

endmodule
