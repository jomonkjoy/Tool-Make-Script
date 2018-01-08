module ChipLevel (
   input  logic [15:0] data16_a, data16_b, data16_c, data16_d,
   input  logic [7:0] din_a, din_b,
   input  logic [1:0] sel,
   input  logic clk, cin, rst, start,
   input  logic s1, s2, op,
   output logic [15:0] mux_out, regout,
   output logic [31:0] m32_out,
   output logic cout1, cout2, comp_out1, comp_out2
);
   
logic [15:0] ad16_sout, ad8_sout, m16_out, cnt;

Adder16 u1 (.ain(data16_a), .bin(data16_b), .cin(cin), .cout(cout1),
            .sout(ad16_sout), .clk(clk));
CascadeMod u2 (.data1(data16_a), .data2(data16_b), .cin(cin), .s(ad8_sout),
               .cout(cout2), .clk(clk), .comp_out(comp_out1), .cnt(cnt),
               .rst(rst), .start(start) );
Comparator u3 (.ain(ad16_sout), .bin(ad8_sout), .cp_out(comp_out2));
Multiply8x8 u4 (.op1(din_a), .op2(din_b), .res(m16_out), .clk(clk));
Multiply16x16 u5 (.op1(data16_a), .op2(data16_b), .res(m32_out), .clk(clk));
MuxMod  u6 (.Y_IN(mux_out), .MUX_CNT(sel), .D(ad16_sout), .R(ad8_sout),
            .F(m16_out), .UPC(cnt));
PathSegment u7 (.R1(data16_a), .R2(data16_b), .R3(data16_c), .R4(data16_d),
                .S2(s2), .S1(s1), .OP(op), .REGOUT(regout), .clk(clk));
endmodule
