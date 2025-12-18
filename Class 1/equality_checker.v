
module equality_checker (
 input reg [1:0] A, B,
output reg OUT);


assign OUT = ~(A ^ B);

endmodule