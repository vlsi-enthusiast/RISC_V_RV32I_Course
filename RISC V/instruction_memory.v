/*

0. 0000 0000

inputs: pc
output: instr

*/

module instruction_memory (
input [31:0] pc,
output [31:0] instr);

reg [31:0] mem [0:15];

wire [31:0] addr;

/*
0x0000 = 0
0x0004 = 0000 0100
0000 0100 >> 2 = 0000 0001 = 1;
0x0008 = 2
0x0012 = 3
*/

assign addr = pc >> 2;

assign instr = mem[addr];

initial begin
        mem[0]  = 32'h00000013; 
        mem[1]  = 32'h00500093; 
        mem[2]  = 32'h00600113; 
        mem[3]  = 32'h002081B3; 
        mem[4]  = 32'h00310023; 
        mem[5]  = 32'h00008067; 
        mem[6]  = 32'h00000013;
        mem[7]  = 32'h00000013;
        mem[8]  = 32'h00000013;
        mem[9]  = 32'h00000013;
        mem[10] = 32'h00000013;
        mem[11] = 32'h00000013;
        mem[12] = 32'h00000013;
        mem[13] = 32'h00000013;
        mem[14] = 32'h00000013;
        mem[15] = 32'h00000013;
end

endmodule





