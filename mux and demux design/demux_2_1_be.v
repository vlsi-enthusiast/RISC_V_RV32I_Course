
module demux_1_2_be (
input y, sel,
output reg o0, o1);
//sel->0; y->o0;sel-> ; y -> o1;
always @(*) begin
if (sel) begin
o1 = y;
o0 = 0;
end
else begin
o0 = y;
o1 = 0;
end
end
endmodule
