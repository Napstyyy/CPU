module DataMemory (
  input [31:0] Address,
  input [31:0] DataWr,
  input DMWr,
  input [2:0] DMCtrl,
  output logic [31:0] DataRd
);

  logic [7:0] Memory [0:2048];

  always @(Address or DataWr or DMCtrl or DMWr) begin
    case (DMCtrl)
      3'b000: begin
        DataRd = {{24{Memory[Address][7]}}, Memory[Address]}; // Byte
      end
      3'b001: begin
        DataRd = {{16{Memory[Address + 1][7]}}, Memory[Address + 1], Memory[Address]}; // HalfWord (signed)
      end
      3'b010: begin
        DataRd = {Memory[Address + 3], Memory[Address + 2], Memory[Address + 1], Memory[Address]}; // Word
      end
      3'b100: begin
        DataRd = {{24{1'b0}}, Memory[Address]}; // Byte (unsigned)
      end
      3'b101: begin
        DataRd = {{16{1'b0}}, Memory[Address + 1], Memory[Address]}; // HalfWord (unsigned)
      end
      default: begin
        DataRd = Memory[Address]; // Por defecto, leer una palabra
      end
    endcase


    if (DMWr) begin
      #1
      // Si DMWr es 1, escribir en la dirección especificada por Address
      if (DMCtrl == 3'b000) begin
        Memory[Address] <= DataWr[7:0];
      end
      else if (DMCtrl == 3'b001) begin
        Memory[Address] <= DataWr[7:0];
        Memory[Address + 1] <= DataWr[15:8];
      end
      else if (DMCtrl == 3'b010) begin
        Memory[Address] <= DataWr[7:0];
        Memory[Address + 1] <= DataWr[15:8];
        Memory[Address + 2] <= DataWr[23:16];
        Memory[Address + 3] <= DataWr[31:24];
      end
      else if (DMCtrl == 3'b100) begin
        Memory[Address] <= DataWr[7:0];
      end
      else if (DMCtrl == 3'b101) begin
        Memory[Address] <= DataWr[7:0];
        Memory[Address + 1] <= DataWr[15:8];
      end
    end
  end
endmodule
