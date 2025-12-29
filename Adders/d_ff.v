module d_ff (
input d, clk, rst,
output reg q, q_b);

always @(posedge clk or posedge rst) begin
 if (rst) begin q = 0; end
else begin q=d; end
end
assign q_b = ~q;
endmodule
