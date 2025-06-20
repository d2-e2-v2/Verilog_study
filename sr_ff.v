`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 00:03:39
// Design Name: 
// Module Name: sr_ff
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


module sr_ff(clock,q,qbar,set,clear,reset );
input clock,set,clear;
input wire reset;
output wire q,qbar;
wire sn,rn;
nand n4(rn,reset,clock);
nand n1(sn,set,clock);
nand n2(q,sn,qbar,clear);
nand n3(qbar,sn,q,clear);

endmodule
