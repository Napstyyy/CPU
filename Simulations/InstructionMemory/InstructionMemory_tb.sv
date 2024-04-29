module InstructionMemory_tb;

    // Parámetros
    parameter ADDRESS_WIDTH = 32;
    parameter DATA_WIDTH = 32;
    
    // Entradas
    logic [ADDRESS_WIDTH-1:0] address;
    
    // Salidas
    logic [DATA_WIDTH-1:0] instruction;
    
    // Clock
    logic clk;
    
    // Instancia del módulo bajo prueba
    InstructionMemory dut (
        .address(address),
        .instruction(instruction)
    );

    // Generador de clock
    always #5 clk = ~clk;

    // Testbench
    initial begin
        // Inicialización de la simulación
        $dumpfile("InstructionMemory_tb.vcd");
        $dumpvars(0, InstructionMemory_tb);
        
        // Inicialización de la memoria de instrucciones
        $readmemh("test.mem", dut.memory);
        
        // Reset inicial
        address = 0;
        #10;
        
        // Test 1: Leer instrucción en la dirección 0
        address = 0;
        #10;
        if (instruction !== 32'hXXXXXXXX) $display("Test 1: Failed");
        else $display("Test 1: Passed");

        // Test 2: Leer instrucción en la dirección 4
        address = 4;
        #10;
        if (instruction !== 32'hXXXXXXXX) $display("Test 2: Failed");
        else $display("Test 2: Passed");
        
        // Añade más pruebas según sea necesario
        
        // Finalizar simulación
        $finish;
    end
    
endmodule
