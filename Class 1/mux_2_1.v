module mux_2_1 (
input reg A, B, SEL,
output reg OUT);
always @(*) begin
if (SEL) begin OUT = A;  //$display("At time %0t, Input A = %b, B=%b, SEL=%b,Output OUT = %b", $time, A, B, SEL, OUT); 
end
else begin OUT = B; //$display("At time %0t, Input A = %b, B=%b, SEL=%b,Output OUT = %b", $time, A, B, SEL, OUT); 
end
//assign OUT = (SEL) ? B:A;
end
endmodule
