
module demux_2_1 (
input reg y, sel,
output reg i0,i1);
always @(*) begin
if (sel) begin i0=y; end
else begin i1=y; end
end
endmodule