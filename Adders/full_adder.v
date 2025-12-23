
module full_Adder(
input [3:0] A, B,
input Cin,
output [3:0] Sum,
output Cout);

assign Sum = A ^ B ^ Cin;
assign Cout = (A&B)|(B&Cin)|(A&Cin);

endmodule