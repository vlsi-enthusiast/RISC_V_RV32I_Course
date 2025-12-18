module async_sr_ff (
input reg S, R, RST, CLK,
output reg Q, Q_B);

always @(posedge CLK or posedge RST) begin
 if (RST) begin
   Q <= 1'b0;
 end
 else begin
  case ({S,R}) 
	2'b00: Q=~Q;
	2'b01: Q=1'b0;
	2'b10:Q=1'b1;
	2'b11:Q=1'b0;
  endcase
end
end

assign Q_B = ~Q;

endmodule

