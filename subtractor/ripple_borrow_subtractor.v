
module half_subtractor_data (
input A, B, 
output reg Diff, 
output reg Bor);
assign Diff = A ^ B;
assign Bor =  ~A & B;
endmodule

module fas (
input A, B,
input Bin,
output Diff,
output reg Bor);
wire w1; 
wire b1, b2;
half_subtractor_data h1(.A(A),.B(B),.Diff(w1),.Bor(b1));
half_subtractor_data h2(.A(Bin),.B(w1),.Diff(Diff),.Bor(b2));

assign Bor = b1 | b2;
endmodule


module ripple_borrow_subtractor (
input [3:0] A, B,
input Bin,
output [3:0] Diff,
output Bor);
wire b0, b1, b2;
fas fs1(.A(A[0]),.B(B[0]),.Bin(Bin),.Diff(Diff[0]),.Bor(b0));
fas fs2(.A(A[1]),.B(B[1]),.Bin(b0),.Diff(Diff[1]),.Bor(b1));
fas fs3(.A(A[2]),.B(B[2]),.Bin(b1),.Diff(Diff[2]),.Bor(b2));
fas fs4(.A(A[3]),.B(B[3]),.Bin(b2),.Diff(Diff[3]),.Bor(Bor));

endmodule
