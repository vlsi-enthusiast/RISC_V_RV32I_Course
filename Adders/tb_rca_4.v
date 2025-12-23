`timescale 1ns/1ps
module tb_rca_4;
reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Cout;


rca_4 (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));

initial begin
A=4'b0000; B=4'b0001; Cin=1'b0; #10;
A=4'b0001; B=4'b0011; Cin=1'b0; #10;
A=4'b0011; B=4'b0111; Cin=1'b0; #10;
A=4'b0001; B=4'b0111; Cin=1'b0; #10;
A=4'b1000; B=4'b1001; Cin=1'b0; #10;

end
endmodule
