
module adder_32 (
    input  [31:0] a,
    input  [31:0] b,
    input         cin,      // carry input
    output [31:0] sum,
    output        cout      // carry output
);

    assign {cout, sum} = a + b + cin;

endmodule
