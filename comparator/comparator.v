
module comp (
input [3:0] A, B,
output reg G,
output reg E,
output reg L
);

always @(*) begin
if (A>B) begin G=1'b1; E=1'b0; L=1'b0; end
else if (A==B) begin G=1'b0; E=1'b1; L=1'b0; end
else begin G=1'b0; E=1'b0; L=1'b1; end
end
endmodule