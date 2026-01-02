/* 2's Complement 
A=0010
B=0001
         001         
A	=1101
            1
-------------
sum	=1110

         000
A	=1110
B	=0001
--------------
Diff	=1111

Diff = 1111

                  000
Diff 		= 0000
          	     1
-----------------------
Org Diff =        0001
-----------------------
*/
module two_complement_subtractor (
input [3:0] A, B,
output reg[4:0] Diff, 
output reg Borr);

wire [4:0] diff;

assign diff = (~A+1) + B;

assign Diff = ~diff+1;
assign Borr = Diff[4];


endmodule 
