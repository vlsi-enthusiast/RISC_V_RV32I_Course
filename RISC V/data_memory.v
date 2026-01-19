module data_memory (
input clk,
input mem_read,
input mem_write,
input [31:0] addr,
input [31:0] write_data,
input [2:0] funct3,
output reg [31:0] read_data);

reg [7:0] mem [0:4095]; //4KB

wire [31:0] aligned_addr = {addr[31:2],2'b00}; //word aligned address

//write operation
/*  SB (Store Byte) -> Write only lowest 8 bits 
    SH (Store Half Word) -> writes first 2 bytes (16 bits)
    SW (Store Word) -> writes 4 bytes (32 bits) */

always @(posedge clk) begin
 if (mem_write) begin
  case (funct3)
	3'b000: begin //SB - Store Byte
          mem[addr] <= write_data[7:0];
         end
        3'b001: begin //SH - Store Halfword
/*1 - 1byte */ mem[addr] <= write_data[7:0]; //1-byte
/*2 - 1byte */ mem[addr + 1] <= write_data[15:8]; end
        3'b010: begin //SW - Store Word
                mem[addr] <= write_data[7:0]; //1-byte
/*2 - 1byte */  mem[addr + 1] <= write_data[15:8]; //2 - byte
                mem[addr + 2] <= write_data[23:16]; // 3 - byte
                mem[addr + 3] <= write_data[31:24]; end
        endcase
      end
   end
// read operation
/* LB, LH, LW */
 always @(*) begin
    if (mem_read) begin
       case (funct3) 
           3'b000: begin // Load Byte - LB // signed
                read_data = {{24{mem[addr][7]}}, mem[addr]}; //sign extension
            end
            3'b001: begin //LH - Signed
                 read_data = {{16{mem[addr+1][7]}}, mem[addr+1], mem[addr]};
            end
            3'b010: begin  //LW
                  read_data = {mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]};
            end
            3'b100: begin //LB - unsign
                   read_data = {24'b0, mem[addr]};
             end
             3'b101: begin //LH - unsign
                   read_data = {16'b0, mem[addr+1], mem[addr]}; end
              default: read_data = 32'h00000000;
             endcase
         end
else begin
  read_data = 32'h00000000;
end
end
endmodule




