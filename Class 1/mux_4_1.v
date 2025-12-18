// --- 2-to-1 Multiplexer ---
module mux_2_1 (
    input a, b, sel,   
    output reg y       
);
    always @(*) begin
        if (sel) 
            y = b;    
        else 
            y = a;     
    end
endmodule

// --- 4-to-1 Multiplexer ---
module mux_4_1 (
    input i0, i1, i2, i3, 
    input [1:0] sel,      
    output y              
);

    wire w1, w2; 

    mux_2_1 m1(.a(i0), .b(i1), .sel(sel[0]), .y(w1));
    mux_2_1 m2(.a(i2), .b(i3), .sel(sel[0]), .y(w2));
    mux_2_1 m3(.a(w1), .b(w2), .sel(sel[1]), .y(y));


endmodule