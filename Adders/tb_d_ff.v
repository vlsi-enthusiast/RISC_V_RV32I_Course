`timescale 1ns/1ps
module tb_d_ff;
reg d, clk, rst;
wire q, q_b;

d_ff dut (.d(d),.clk(clk),.rst(rst),.q(q),.q_b(q_b));

always #5 clk = ~clk;

initial begin
d=1'b0; clk = 0; rst = 1; #10;
rst = 0; #10;
d=1'b0; #10;
d=1'b1; #10;
#100; $finish;
end

endmodule