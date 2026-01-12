/*
inputs clk,rst, rs1_addr, rs2_addr , reg_write, rd_addr, rd_data, 
output rs1_data, rs2_data

r type = func7[7]  rs2[5]  rs1[5]  func3[3] rd[5]  opcode[7]
*/

module reg_file (
input clk, rst,
input [4:0] rs1_addr, 
input [4:0] rs2_addr,
input reg_write,
input [4:0] rd_addr, 
input [31:0] rd_data,

output [31:0] rs1_data,
output [31:0] rs2_data);

reg [31:0] regs [0:31];

integer i;
initial begin
        regs[0]  = 32'h00000000; 
        regs[1]  = 32'h00000005; 
        regs[2]  = 32'h00000006; 
        regs[3]  = 32'h0000000A; 
        regs[4]  = 32'h00000014; 
        regs[5]  = 32'h0000001E; 
        regs[6]  = 32'h00000028; 
        regs[7]  = 32'h00000032; 

for (i=8; i<32; i=i+1) begin
   regs[i] = 32'b0;
end
end

always @(posedge clk) begin
if (rst) begin
for (i=0;i<32;i=i+1) begin
regs[i] = 32'b0;
end
end
else if (reg_write && (rd_addr != 5'd0)) begin
regs[rd_addr] <= rd_data;
end
end

assign rs1_data = (rs1_addr==5'd0) ? 32'b0 : regs[rs1_addr];
assign rs2_data = (rs2_addr==5'd0) ? 32'b0 : regs[rs2_addr];

endmodule





