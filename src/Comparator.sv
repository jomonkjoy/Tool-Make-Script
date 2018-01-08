module Comparator (
  output logic cp_out,
  input  logic [15:0] ain, bin
  );
  
  assign cp_out = ain < bin;
  
endmodule
