module program_counter (
input wire clk, rst,
input wire pc_src,
input wire [31:0] pc_target,
output reg pc);

wire [31:0] pc_plus_4;

assign pc_plus_4 = pc + 32'd4;

always @(posedge clk or posedge rst) begin
if (rst) begin pc <= 32'd0; end
else if (pc_src) begin pc <= pc_target; end
else begin pc <= pc_plus_4; end
end

endmodule 
 