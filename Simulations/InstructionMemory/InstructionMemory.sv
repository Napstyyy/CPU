module InstructionMemory(
    input logic [31:0] address,
    output logic [31:0] instruction
    );
    logic [7:0] memory [0:256];
    initial begin
        $readmemh("test.mem", memory);
    end
    assign instruction = {memory[address], memory[address + 1], memory[address + 2], memory[address + 3]};

endmodule