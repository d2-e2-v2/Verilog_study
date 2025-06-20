`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 21:38:40
// Design Name: 
// Module Name: edge_jkff
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


module ms_jkff( q,qbar,clock,clear,j,k);
input clock,clear,j,k;
output wire q,qbar;
wire q1,q1bar;
jkflipflop f1(.q(q1),.qbar(q1bar),.j(j),.k(k),.clock(clock),.clear(clear));
sr l1(.clock(~clock),.q(q),.qbar(qbar),.set(q1),.reset(q1bar),.clear(clear));


endmodule
