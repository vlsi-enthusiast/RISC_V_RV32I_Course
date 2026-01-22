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
/*    // 1. addi x1, x0, 5  (Load 5 into x1)  //I-type
    mem[0]  = 32'h00500093; 
    
    // 2. addi x2, x0, 10 (Load 10 into x2)
    mem[1]  = 32'h00A00113; //x2 = x0 + x2
    
    // 3. add x3, x1, x2  (x3 = 5 + 10 = 15)   R-type
    mem[2]  = 32'h002081B3; 
    
    // 4. sub x4, x3, x1  (x4 = 15 - 5 = 10)
    mem[3]  = 32'h40118233; 
    
    //Memory type
    // 5. sw x4, 4(x0)   x4 = x0 +4; target register_address = base register + offset; data = address;
    mem[4]  = 32'h00402223; 
    
    // 6. lw x5, 4(x0)    (Load value 10 from memory into x5)
    mem[5]  = 32'h00402283; */
    
    // addi x1, x0, 5    (Load 5 into register x1)
    mem[0] = 32'h00500093; 
    
    // addi x2, x0, 5    (Load 5 into register x2)
    mem[1] = 32'h00500113; 
    
    // beq x1, x2, 8     (If x1 == x2, jump forward 8 bytes/2 instructions)
    // This will skip mem[3] and go straight to mem[4]
    mem[2] = 32'h00208463; 

    // addi x3, x0, 10   (This instruction will be SKIPPED)
    mem[3] = 32'h00A00193; 

    // addi x4, x0, 20   (Target of the branch)
    mem[4] = 32'h01400213;

    mem[5] = 32'h00208463;

    // Remaining NOPs (addi x0, x0, 0)
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





