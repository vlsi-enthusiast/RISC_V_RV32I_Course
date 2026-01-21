`timescale 1ns / 1ps

module tb_alu_control;

    reg  [1:0] ALUOp;
    reg  [2:0] funct3;
    reg  [6:0] funct7;
    wire [3:0] alu_ctrl;

    alu_control dut (
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7(funct7),
        .alu_ctrl(alu_ctrl)
    );

    initial begin
        // Load instruction (LW)

        ALUOp  = 2'b00; funct3 = 3'b010; funct7 = 7'b0000000; #10;


        // Store instruction (SW)
 
        ALUOp  = 2'b00; funct3 = 3'b010; funct7 = 7'b0000000; #10;

        // Branch instruction (BEQ)

        ALUOp  = 2'b01; funct3 = 3'b000; funct7 = 7'b0000000; #10;

        // R-type ADD
        ALUOp  = 2'b10; funct3 = 3'b000; funct7 = 7'b0000000; #10;
 
        // R-type SUB

        ALUOp  = 2'b10; funct3 = 3'b000; funct7 = 7'b0100000; #10;

        // R-type AND

        ALUOp  = 2'b10; funct3 = 3'b111; funct7 = 7'b0000000; #10;

        // R-type OR
        ALUOp  = 2'b10; funct3 = 3'b110; funct7 = 7'b0000000; #10;
    
        // R-type XOR

        ALUOp  = 2'b10; funct3 = 3'b100; funct7 = 7'b0000000; #10;

        // R-type SLL
        ALUOp  = 2'b10; funct3 = 3'b001; funct7 = 7'b0000000; #10;

        // R-type SRL

        ALUOp  = 2'b10; funct3 = 3'b101; funct7 = 7'b0000000; #10;

        #300;
        $finish;
    end

endmodule

