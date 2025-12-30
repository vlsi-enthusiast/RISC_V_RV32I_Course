
module demux_1_4 (
input y, s0, s1,
output o0, o1, o2, o3);

assign o0= y & (~s0) & (~s1);
assign o1= y & (~s0) & (s1);
assign o2= y & (s0) & (~s1);
assign o3= y & (s0) & (s1);

endmodule