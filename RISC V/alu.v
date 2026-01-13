module alu (
input [31:0] in1,
input [31:0] in2,
input [3:0] alu_ctrl,
output reg [31:0] rslt,
output zero);

assign zero = (rslt == 32'b0);

always @(*) begin
case (alu_ctrl) 
4'b0000: rslt = in1 + in2;
4'b0001: rslt = in1 - in2;
4'b0010: rslt = in1 & in2;
4'b0011: rslt = in1 | in2;
4'b0100: rslt = in1 ^ in2;
4'b0101: rslt = in1 << in2[4:0];
4'b0110: rslt = in1 >> in2[4:0];
default: rslt = 32'b0;
endcase
end

endmodule