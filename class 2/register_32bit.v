module register_32bit (
input wire [31:0] data_in,
input wire rst, clk, write_en,
output reg [31:0] data_out);

always @(posedge clk or posedge rst) begin
if (rst) begin data_out <= 32'b0; end
else if (write_en) begin data_out <= data_in; end
end

endmodule
