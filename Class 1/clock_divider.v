module clock_divider (
    input clk_in,    // High speed clock (e.g., 100MHz)
    input reset,
    output reg clk_out // Low speed clock (e.g., 25MHz)
);

    reg [1:0] counter; // 2-bit counter can count 0, 1, 2, 3

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_out <= 0;
        end else begin
            if (counter == 1) begin  // (N/2 - 1)
                counter <= 0;
                clk_out <= ~clk_out; // Toggle the output
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule