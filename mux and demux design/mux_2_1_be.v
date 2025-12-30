
module mux_2_1 (
input i0, i1,
input sel,
output reg out );
always @(i0 or i1) begin
if (sel) begin out = i1; end
else begin out = i0; end
end
endmodule