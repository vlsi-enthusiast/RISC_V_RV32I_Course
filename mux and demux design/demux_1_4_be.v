module demux_1_to_4_be (
    output reg [3:0] Y, 
    input [1:0] A,    
    input din          
);

always @(*) 
begin
    Y = 4'b0000; 
    case (A)
        2'b00: Y[0] = din; 
        2'b01: Y[1] = din; 
        2'b10: Y[2] = din; 
        2'b11: Y[3] = din; 
    endcase
end
endmodule

