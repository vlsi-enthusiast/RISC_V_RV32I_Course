module alu_control (
input [1:0] ALUOp,
input [2:0] funct3,
input [6:0] funct7,
output reg [3:0] alu_ctrl);

always @(*) begin
 case (ALUOp)
   //Load/Store  -> ADD   lw x1, 4(x2)  -> Effective Address =  base register + 4
    2'b00: alu_ctrl = 4'b0000; //ADD -> Load & Store
    //branch -> SUB -> beq x1, x2 -> x1 == x2 (or) x1 (2) - x2 (2) =0 -> Zero = 1
    2'b01: alu_ctrl = 4'b0001;
    //R-type
    2'b10: begin 
      case (funct3)
        3'b000: begin
            if (funct7 == 7'b0100000)
               alu_ctrl = 4'b0001; //sub
            else
                alu_ctrl = 4'b0000; //add
           end
        3'b111: alu_ctrl = 4'b0010; 
        3'b110: alu_ctrl = 4'b0011; 
        3'b100: alu_ctrl = 4'b0100; 
        3'b001: alu_ctrl = 4'b0101; 
        3'b101: alu_ctrl = 4'b0110;
        default: alu_ctrl = 4'b0000;
      endcase
   end
    //I-type
     2'b11: begin
      case (funct3)
       3'b000: alu_ctrl = 4'b0000; //addi
        3'b111: alu_ctrl = 4'b0010; //andi
        3'b110: alu_ctrl = 4'b0011; //ori
        3'b100: alu_ctrl = 4'b0100; //xori
        3'b001: alu_ctrl = 4'b0101; //slli
        3'b101: alu_ctrl = 4'b0110; //srli
        default: alu_ctrl = 4'b0000;
     endcase
end
   default: alu_ctrl = 4'b0000;
endcase
end

endmodule
         

    
   
    