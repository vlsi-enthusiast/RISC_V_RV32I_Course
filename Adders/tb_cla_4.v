`timescale 1ns/1ps
module tb_cla_4;

reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Cout;

//dut = design under test
cla_4 dut(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));

initial begin
A=4'd0; B=4'd1; Cin=1'b0; #10;
$display("A=%d; B=%d; Cin=%d; Sum=%d; Cout=%d",A,B,Cin,Sum,Cout);
A=4'd1; B=4'd5; Cin=1'b0; #10;
$display("A=%d; B=%d; Cin=%d; Sum=%d; Cout=%d",A,B,Cin,Sum,Cout);
A=4'd5; B=4'd5; Cin=1'b0; #10;
$display("A=%d; B=%d; Cin=%d; Sum=%d; Cout=%d",A,B,Cin,Sum,Cout);
A=4'd9; B=4'd9; Cin=1'b0; #10;
$display("A=%d; B=%d; Cin=%d; Sum=%d; Cout=%d",A,B,Cin,Sum,Cout);

#100;$finish;

end
endmodule
