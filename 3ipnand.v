`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 14:50:01
// Design Name: 
// Module Name: 3ipnand
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nand_3(out,in1,in2,in3);
input in1,in2,in3;
output out;
wire stuff,inverted;
nand n1(stuff,in1,in2);
not not1(inverted,stuff);
nand n2(out,inverted,in3);

endmodule