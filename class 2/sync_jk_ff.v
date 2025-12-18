module sync_jk_ff (
input reg J, K, RST, CLK,
output reg Q, Q_B);

always @(posedge CLK) begin
 if (RST) begin
   Q <= 1'b0;
 end
 else begin
  case ({J,K}) 
	2'b00: Q=Q;
	2'b01: Q=1'b0;
	2'b10:Q=1'b1;
	2'b11:Q=~Q;
  endcase
end
end

assign Q_B = ~Q;

endmodule
