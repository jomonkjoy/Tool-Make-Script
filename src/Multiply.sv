module Multiply8x8 #( 
  parameter DATA_WIDTH = 8
  ) (
  input  logic [DATA_WIDTH-1:0] op1, op2,
  input  logic clk,
  output logic [2*DATA_WIDTH-1:0] res
);

always_ff @(posedge clk) begin
  res <= op1*op2;
end

endmodule

module Multiply16x16 #( 
  parameter DATA_WIDTH = 16
  ) (
  input  logic [DATA_WIDTH-1:0] op1, op2,
  input  logic clk,
  output logic [2*DATA_WIDTH-1:0] res
);

always_ff @(posedge clk) begin
  res <= op1*op2;
end

endmodule
