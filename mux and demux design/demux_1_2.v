
module demux_1_2 (
input y, sel,
output o0, o1);

//sel->0 ; y->o0;
//sel->1 ; y->o1; 
assign o0 = y & (~sel);
assign o1 = y & sel;
endmodule
