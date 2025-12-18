module async_t_ff (
input reg T, RST, CLK,
output reg Q, Q_B);

always @(posedge CLK or posedge RST) begin
  if (RST) begin Q=1'b0; end
  else begin Q = ~Q; end
end

assign Q_B = ~Q;

endmodule