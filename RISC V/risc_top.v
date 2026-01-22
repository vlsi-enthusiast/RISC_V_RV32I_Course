module risc_top (
input clk, rst,
output [31:0] out);

wire [31:0] pc_out;
wire [31:0] instr_out;
wire [31:0] rs1_data, rs2_data;
wire [31:0] alu_mux;
wire [3:0] alu_ctrl;
wire [31:0] immout;
wire RegWrite_top, ALUSrc_top, MemRead_top, MemWrite_top, MemtoReg_top, Branch_top;
wire [1:0] ALUOp_top;
wire alu_zero;
wire [31:0] alu_out;
wire [31:0] mem_out;
wire pc_src;
wire [31:0] pc_target;

program_counter i1 (.clk(clk),.rst(rst),.pc_src(pc_src),.pc_target(pc_target),.pc(pc_out));

instruction_memory i2 (.pc(pc_out),.instr(instr_out));

control_unit i3 (.opcode(instr_out[6:0]),.RegWrite(RegWrite_top),.ALUSrc(ALUSrc_top),.MemRead(MemRead_top),.MemWrite(MemWrite_top),.MemtoReg(MemtoReg_top),.Branch(Branch_top),.ALUOp(ALUOp_top));

alu_control i4 (.ALUOp(ALUOp_top),.funct3(instr_out[14:12]),.funct7(instr_out[31:25]),.alu_ctrl(alu_ctrl));

imm_gen i5 (.instr(instr_out),.imm(immout));

adder_32 i6 (.a(pc_out),.b(immout),.cin(1'b0),.sum(pc_target),.cout());

reg_file i7 (.clk(clk),.rs1_addr(instr_out[19:15]),.rs2_addr(instr_out[24:20]),.reg_write(RegWrite_top),.rd_addr(instr_out[11:7]),.rd_data(out),.rs1_data(rs1_data),.rs2_data(rs2_data));

mux_2_1 i8 (.d0(rs2_data),.d1(immout),.sel(ALUSrc_top),.y(alu_mux));

alu i9 (.in1(rs1_data),.in2(alu_mux),.alu_ctrl(alu_ctrl),.rslt(alu_out),.zero(alu_zero));

and a1 (pc_src, Branch_top, alu_zero);

data_memory i10 (.clk(clk),.mem_read(MemRead_top),.mem_write(MemWrite_top),.addr(alu_out),.write_data(rs2_data),.funct3(instr_out[14:12]),.read_data(mem_out));

mux_2_1 i11 (.d0(alu_out),.d1(mem_out),.sel(MemtoReg_top),.y(out));

endmodule



