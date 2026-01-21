`timescale 1ns / 1ps

module tb_imm_gen;

    reg  [31:0] instr;
    wire [31:0] imm;

    // Instantiate the Immediate Generator
    imm_gen uut (
        .instr(instr),
        .imm(imm)
    );

    initial begin

        // I-Type: ADDI x1, x2, 10
        // imm = 10

        instr = 32'b00000000001000010000000010010011;
        #10;

        // I-Type: LW x1, 8(x2)
        // imm = 8

        instr = 32'b00000000100000010010000010000011;
        #10;

        // S-Type: SW x1, 12(x2)
        // imm = 12

        instr = 32'b000000000001000010001000110000100011;
        #10;

        // B-Type: BEQ x1, x2, 16
        // imm = 16

        instr = 32'b00000000001000001000100001100011;
        #10;

        // U-Type: LUI x1, 0x00012
        // imm = 0x00012000
 
        instr = 32'b00000000000000010010000010110111;
        #10;

        // J-Type: JAL x1, 32
        // imm = 32

        instr = 32'b00000001000000000000000011101111;
        #10;

        $finish;
    end

endmodule
