module sync_d_ff (
input reg D, RST, CLK,
output reg Q, Q_B);

always @(posedge CLK) begin
  if (RST) begin Q=1'b0; end
  else begin Q = Q; end
end

assign Q_B = ~Q;

endmodule