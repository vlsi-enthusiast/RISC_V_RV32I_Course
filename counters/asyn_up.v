module dff (
    input d, clk, rst,
    output reg q,
    output q_b
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

assign q_b = ~q;

endmodule


module asyn_up (
    input clk, rst,
    output [3:0] q
);

wire q_b0, q_b1, q_b2, q_b3;

dff d0(.d(~q[0]), .clk(clk),   .rst(rst), .q(q[0]), .q_b(q_b0));    
dff d1(.d(~q[1]), .clk(q_b0),  .rst(rst), .q(q[1]), .q_b(q_b1));
dff d2(.d(~q[2]), .clk(q_b1),  .rst(rst), .q(q[2]), .q_b(q_b2));
dff d3(.d(~q[3]), .clk(q_b2),  .rst(rst), .q(q[3]), .q_b(q_b3));

endmodule

