module jk_ff (
    input j, k, clk, rst,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;       
                2'b01: q <= 1'b0;    
                2'b10: q <= 1'b1;    
                2'b11: q <= ~q;      
            endcase
        end
    end
endmodule

module sync_up (
    input clk, rst,
    output [3:0] q
);

    wire T1, T2, T3;

    assign T1 = q[0];              
    assign T2 = q[0] & q[1];       
    assign T3 = q[0] & q[1] & q[2];

    jk_ff ff0( .j(1'b1), .k(1'b1), .clk(clk), .rst(rst), .q(q[0]) );
    jk_ff ff1( .j(T1),   .k(T1),   .clk(clk), .rst(rst), .q(q[1]) );
    jk_ff ff2( .j(T2),   .k(T2),   .clk(clk), .rst(rst), .q(q[2]) );
    jk_ff ff3( .j(T3),   .k(T3),   .clk(clk), .rst(rst), .q(q[3]) );

endmodule

