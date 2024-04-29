`timescale 1ns / 1ps

module ControlUnit_tb;

    // Parámetros
    parameter PERIOD = 10;

    // Señales de entrada
    logic [6:0] opcode;
    logic [2:0] Funct3;
    logic [6:0] Funct7;

    // Señales de salida
    logic RUWr;
    logic [3:0] ALUOp;
    logic [2:0] ImmSrc;
    logic ALUASrc;
    logic ALUBSrc;
    logic DMWr;
    logic [2:0] DMCtrl;
    logic [4:0] BrOp;
    logic [1:0] RUDataWrSrc;

    // Instancia de ControlUnit
    ControlUnit dut (
        .opcode(opcode),
        .Funct3(Funct3),
        .Funct7(Funct7),
        .RUWr(RUWr),
        .ALUOp(ALUOp),
        .ImmSrc(ImmSrc),
        .ALUASrc(ALUASrc),
        .ALUBSrc(ALUBSrc),
        .DMWr(DMWr),
        .DMCtrl(DMCtrl),
        .BrOp(BrOp),
        .RUDataWrSrc(RUDataWrSrc)
    );

    // Generador de estímulo
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, ControlUnit_tb);
        // Casos de prueba
        // Caso 1: opcode == 7'b0110011
        opcode = 7'b0100011;
        Funct3 = 3'b000; // Ejemplo de Funct3
        Funct7 = 7'b0000000; // Ejemplo de Funct7
        #PERIOD; // Espera un ciclo de reloj
        // Verificar las señales de salida aquí

        // Caso 2: opcode == 7'b1100011
        opcode = 7'b0110111;
        Funct3 = 3'b001; // Ejemplo de Funct3
        Funct7 = 7'b0000001; // Ejemplo de Funct7
        #PERIOD; // Espera un ciclo de reloj
        // Verificar las señales de salida aquí

        // Otros casos de prueba...

        // Finalizar simulación
        $finish;
    end

endmodule
