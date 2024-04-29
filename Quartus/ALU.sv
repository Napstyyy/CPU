module ALU(
	input logic[3:0] A,
	input logic[3:0] B,
	input logic[1:0] ALUOP,
	output logic[3:0] S

);

	always_comb begin
		case (ALUOP)
			2'b00: S = A + B;
			2'b01: S = A - B;
			2'b10: S = A & B;
			2'b11: S = A | B;
			default: S = 0;
		endcase
	end
endmodule