module imm_gen(
input [31:0] instr,
output reg [31:0] imm);

wire [6:0] opcode;
assign opcode = instr[6:0];

always @(*) begin
 case(opcode)
  //I-type(Addi, andi, ori, xori, LW, Jalr)
   7'b0010011, //op-IM
   7'b0000011,  //Load
   7'b1100111: imm = {{20{instr[31]}}, instr[31:20]};

  //store imm[11:0] = instr[31:25] instr[11:7]
  7'b0100011: imm = {{20{instr[31]}}, instr[31:25],instr[11:7]};

  //B-type  imm[12|10:5|4:1|11] 
  7'b1100011: imm= {{19{instr[31]}}, instr[31],instr[7], instr[30:25],instr[11:8],1'b0};
  
  //Jump 
  7'b1101111: imm = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};

  default: imm=32'b0;
endcase
end
endmodule