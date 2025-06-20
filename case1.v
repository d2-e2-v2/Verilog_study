`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:14:59
// Design Name: 
// Module Name: case1
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




module jkflipflop(q,qbar,j,k,clock,clear); // this will use nand.
input  j,k,clock,clear;
output wire q,qbar;
wire intq,intq2;
   

nand_3 k1222(.out(intq),.in1(j),.in2(clock),.in3(qbar));
nand_3 K222(.out(intq2),.in1(k),.in2(clock),.in3(q));
 nand_3 j1( q,intq,qbar,clear);
 nand_3 j2(qbar,intq2,q,clear);


endmodule

