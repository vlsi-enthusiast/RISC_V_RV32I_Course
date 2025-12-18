
// 1. Module Declaration
module logic_gate (
    input wire a,       // Input A
    input wire b,       // Input B
    output wire out_and,
    output wire out_or,
    output wire out_xor,
    output wire out_nand,
    output wire out_nor,
    output wire out_not_a
);

    // 2. Hardware Thinking: Continuous Assignment
    
    assign out_and   = a & b;       // AND gate
    assign out_or    = a | b;       // OR gate
    assign out_xor   = a ^ b;       // XOR gate
    assign out_nand  = ~(a & b);    // NAND (NOT AND)
    assign out_nor   = ~(a | b);    // NOR (NOT OR)
    assign out_not_a = ~a;          // Inverter for input A

endmodule