module mux_4_1_data (
input i0, i1, i2, i3, s0, s1,
output reg y);

//00->i0, 01->i1,
 
//10->i2, 11-> i3
//10 -> 1->s1, 0-> s0
assign y = s1 ? (s0 ? i3 : i2) : (s0 ? i1 : i0);

endmodule
