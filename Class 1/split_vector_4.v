module split_vector_4 (
    input  wire [7:0] data_in,   // 8-bit input bus
    output wire [3:0] upper_nibble, // Bits 7, 6, 5, 4
    output wire [3:0] lower_nibble, // Bits 3, 2, 1, 0
    output wire [7:0] swapped_data  // Re-combined data
);

    // 1. Splitting using Bit-Slicing
    assign upper_nibble = data_in[7:4];
    assign lower_nibble = data_in[3:0];

    // 2. Joining using Concatenation { }
    assign swapped_data = {lower_nibble, upper_nibble};

endmodule