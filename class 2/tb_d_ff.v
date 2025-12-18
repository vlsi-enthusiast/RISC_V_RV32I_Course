`timescale 1ns/1ps
module tb_d_ff;
reg D; 
reg RST;
reg CLK;
wire Q;
wire Q_B;

async_d_ff dut(.D(D),.RST(RST),.CLK(CLK),.Q(Q),.Q_B(Q_B));

always #5 CLK = ~CLK;

initial begin
 CLK = 0; D=0; RST = 1'b1; #10;

RST = 1'b0; #5;

D=1'b0; #10;
D=1'b1; #10;

#100; $finish;

end

endmodule
