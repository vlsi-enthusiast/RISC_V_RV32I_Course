`timescale 1ns/1ps
module tb_reg_file;
reg clk;
reg [4:0] rs1_addr; 
reg [4:0] rs2_addr;
reg reg_write;
reg [4:0] rd_addr;
reg [31:0] rd_data;

wire [31:0] rs1_data;
wire [31:0] rs2_data;

reg_file dut(.clk(clk),.rs1_addr(rs1_addr),.rs2_addr(rs2_addr),.reg_write(reg_write),.rd_addr(rd_addr),.rd_data(rd_data),.rs1_data(rs1_data),.rs2_data(rs2_data));

always #5 clk = ~clk;

initial begin

clk = 0;
rs1_addr = 0; 
rs2_addr = 0;
reg_write = 0;
rd_addr = 0;
rd_data= 0;


#10;
//read operation
rs1_addr = 5'd1;
rs2_addr = 5'd2;

#10;

rs1_addr = 5'd0;

#10;

//Write
reg_write = 1;
rd_addr = 5'd10;
rd_data= 5'd5;

#10;
//overwrite
reg_write = 1;
rd_addr = 5'd3;
rd_data= 5'd10;

#10;

rs1_addr = 5'd3;

#10;

#200;
$finish;

end
endmodule

