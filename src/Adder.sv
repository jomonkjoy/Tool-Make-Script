module Adder16 #(
  parameter DATA_WIDTH = 16
  ) (
  output logic [DATA_WIDTH-1:0] sout,
  output logic cout,
  input  logic [DATA_WIDTH-1:0] ain, bin,
  input  logic cin, clk
  );
  
  logic [DATA_WIDTH-1:0] s_ain,s_bin;
  logic s_cin;
  
  always_ff @(posedge clk) begin
    s_ain <= ain;
    s_bin <= bin;
    s_cin <= cin;
    {cout,sout} <= s_ain + s_bin + s_cin;
  end
  
endmodule

module Adder8 #(
  parameter DATA_WIDTH = 8
  ) (
  output logic [DATA_WIDTH-1:0] sout,
  output logic cout,
  input  logic [DATA_WIDTH-1:0] ain, bin,
  input  logic cin, clk
  );
  
  logic [DATA_WIDTH-1:0] s_ain,s_bin;
  logic s_cin;
  
  always_ff @(posedge clk) begin
    s_ain <= ain;
    s_bin <= bin;
    s_cin <= cin;
    {cout,sout} <= s_ain + s_bin + s_cin;
  end
  
endmodule
