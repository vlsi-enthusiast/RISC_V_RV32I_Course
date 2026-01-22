
module mux_2_1 (
    input  wire [31:0] d0,
    input  wire [31:0] d1,
    input  wire sel,
    output reg [31:0] y
);

    assign y = (sel) ? d1 : d0;

endmodule
