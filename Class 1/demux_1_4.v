module demux_1_2 (
input reg y, sel,
output reg i0,i1);
always @(*) begin
if (sel) begin i0=y; end
else begin i1=y; end
end
endmodule

module demux_1_4 (
input reg y,
input reg [1:0] sel,
output reg o0,o1,o2,o3);

wire w1,w2;

demux_1_2 d1(.y(y),.sel(sel[0]),.i0(w1),.i1(w2));
demux_1_2 d2(.y(w1),.sel(sel[1]),.i0(o0),.i1(o1));
demux_1_2 d3(.y(w2),.sel(sel[1]),.i0(o2),.i1(o3));

endmodule

