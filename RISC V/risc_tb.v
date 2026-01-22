`timescale 1ns / 1ps

module risc_tb;
    reg clk;
    reg rst;
    wire [31:0] out;

    // Instantiate the Top Module
    risc_top uut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock Generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        // Reset Pulse
        #15 rst = 0;

        // Run simulation for 200ns
        #200;

        $display("Simulation Finished. Final Output: %h", out);
        $finish;
    end

endmodule
