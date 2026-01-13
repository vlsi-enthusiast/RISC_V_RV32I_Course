`timescale 1ns/1ps

module tb_alu;
reg [31:0] in1;
reg [31:0] in2;
reg [3:0] alu_ctrl;
wire [31:0] rslt;
wire zero;

alu dut(.in1(in1),.in2(in2),.alu_ctrl(alu_ctrl),.rslt(rslt),.zero(zero));


initial begin
//addition
in1 = 32'd1; in2 = 32'd2; alu_ctrl=4'b0000; #10;
in1 = 32'd4; in2 = 32'd2; alu_ctrl=4'b0001; #10;
in1 = 32'd2; in2 = 32'd2; alu_ctrl=4'b0010; #10;
in1 = 32'd1; in2 = 32'd2; alu_ctrl=4'b0011; #10;
in1 = 32'd5; in2 = 32'd2; alu_ctrl=4'b0101; #10;
in1 = 32'd0; in2 = 32'd0; alu_ctrl=4'b1111; #10;
#200; $finish;
end
endmodule