module PathSegment (
  input  logic [15:0] R1, R2, R3, R4,
  input  logic S2, S1, clk,
  input  logic OP,
  output logic [15:0] REGOUT
);

logic [15:0] ADATA, BDATA;
logic MODE;
logic [15:0] product;

always_ff @(posedge clk) begin
  case(S1)
    1'b0 : ADATA <= R1;
    1'b1 : BDATA <= R2;
  endcase
  case(S2)
    1'b0 : ADATA <= R3;
    1'b1 : BDATA <= R4;
  endcase
end
// instantiate DW02_mult
DW02_mult #(8,8) U100 (.A(ADATA[7:0]), .B(BDATA[7:0]), .TC(1'b0), 
.PRODUCT(product));

always_ff @(posedge clk) begin
  case(OP)
    1'b0 : REGOUT <= ADATA + BDATA;
    1'b1 : REGOUT <= product;
  endcase
end

endmodule
