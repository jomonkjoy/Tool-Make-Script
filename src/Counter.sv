module Counter (
  input  logic clk,
  input  logic rst,
  input  logic start,
  output logic [15:0] count
);

  always_ff @(posedge clk) begin
    if (rst) begin
      count <= 16'd0;
    end else if (start) begin
      count <= 16'd1;
    end else begin
      count <= count + 1;
    end
  end
  
endmodule
