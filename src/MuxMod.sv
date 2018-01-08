module  MuxMod (
   output logic [15:0] Y_IN;
   input  logic [ 1:0] MUX_CNT;
   input  logic [15:0] D, F, R, UPC
   );
   
   always_comb begin
    case(MUX_CNT)
      2'b00 : Y_IN = D;
      2'b01 : Y_IN = R;
      2'b10 : Y_IN = F;
      2'b11 : Y_IN = UPC;
    endcase
   end
   
endmodule
