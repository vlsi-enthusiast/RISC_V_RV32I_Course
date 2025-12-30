//data flow modelling
module mux_2_1 (
input i0, i1,
input sel,
output out );
//if sel = 1 -> i1, sel = 0 -> i0;
assign out = sel ? i1: i0;
endmodule
