`timescale 1ns/1ps

module tb_data_memory;
    reg  clk;
    reg  mem_read;
    reg  mem_write;
    reg  [31:0] addr;
    reg  [31:0] write_data;
    reg  [2:0]  funct3;
    wire [31:0] read_data;

    data_memory uut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .addr(addr),
        .write_data(write_data),
        .funct3(funct3),
        .read_data(read_data)
    );

    always #5 clk = ~clk;

    initial begin
  
        clk = 0;
        mem_read = 0;
        mem_write = 0;
        addr = 0;
        write_data = 0;
        funct3 = 0;

        #10;

        // TEST STORE BYTE (SB)
        $display("\nTEST SB (Store Byte)");
        addr = 32'h00000004;
        write_data = 32'h12345678;  
        funct3 = 3'b000;            
        mem_write = 1;
        #10 mem_write = 0;

        // TEST LB (Load Byte Signed)
        $display("TEST LB (Load Byte Signed)");
        mem_read = 1;
        funct3 = 3'b000;   // LB
        #10;
        $display("LB = %h", read_data);
        mem_read = 0;


        // TEST STORE HALFWORD (SH)
        $display("\nTEST SH (Store Halfword)");
        addr = 32'h00000008;
        write_data = 32'hAABBCCDD;  // store DD CC
        funct3 = 3'b001;            // SH
        mem_write = 1;
        #10 mem_write = 0;

        // TEST LH (Load Halfword Signed)
        $display("TEST LH (Load Halfword Signed)");
        mem_read = 1;
        funct3 = 3'b001;  // LH
        #10;
        $display("LH = %h", read_data);
        mem_read = 0;

        // TEST LHU (Load Halfword Unsigned)
        $display("TEST LHU (Load Halfword Unsigned)");
        mem_read = 1;
        funct3 = 3'b101;  // LHU
        #10;
        $display("LHU  = %h", read_data);
        mem_read = 0;

 
        // TEST STORE WORD (SW)
        $display("\nTEST SW (Store Word)");
        addr = 32'h00000010;
        write_data = 32'h11223344;
        funct3 = 3'b010;  // SW
        mem_write = 1;
        #10 mem_write = 0;

        // TEST LW (Load Word)
        $display("TEST LW (Load Word)");
        mem_read = 1;
        funct3 = 3'b010;  // LW
        #10;
        $display("LW = %h", read_data);
        mem_read = 0;


        $display("\nTEST LBU (Load Byte Unsigned)");
        addr = 32'h00000004;  // earlier SB wrote 0x78
        mem_read = 1;
        funct3 = 3'b100;      // LBU
        #10;
        $display("LBU = %h", read_data);
        mem_read = 0;

        $finish;
    end

endmodule

