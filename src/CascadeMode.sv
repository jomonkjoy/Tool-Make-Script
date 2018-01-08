module CascadeMod (
  input  logic [15:0] data1, data2,
  output logic [15:0] s, cnt,
  input  logic clk, cin, rst, start,
  output logic cout, comp_out
);

logic co;
Adder8 u10 (.ain(data1[7:0]), .bin(data2[7:0]), .cin(cin), .clk(clk), 
.sout(s[7:0]), .cout(co));
Adder8 u11 (.ain(data1[15:8]), .bin(data2[15:8]), .cin(co), .clk(clk), 
.sout(s[15:8]), .cout(cout));
Comparator u12 (.ain(s), .bin(cnt), .cp_out(comp_out));
Counter u13 (.count(cnt), .start(start), .clk(clk), .rst(rst));

endmodule
