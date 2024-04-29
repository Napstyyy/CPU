module RegisterUnit (
  input wire clk,
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd,
  input [31:0] DataWr,
  input RUWr,
  output reg [31:0] RURs1,
  output reg [31:0] RURs2
);

  logic [31:0] RU [0:31];

initial begin
    for (int i = 0; i < 32; i++) begin
        RU[i] = 32'h00000000;
    end
    RU[2] = 32'd1000;
end

  assign RURs1 = RU[rs1]; 
  assign RURs2 = RU[rs2];

  always @(posedge clk) begin
    if(RUWr && rd != 0) 
      RU[rd] <= DataWr;
  end //always 


endmodule