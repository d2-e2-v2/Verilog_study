`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 09:54:54
// Design Name: 
// Module Name: sr
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


module sr(
     set,
     reset,
     clock,
     clear,
   q,
   qbar
    );
    
   
    input set,reset,clock,clear;
     output  wire q;
     output wire qbar;
    wire sn,rn;
  nand n1(sn,set,clock);
  nand n2 (rn,reset,clock);
  nand_3 k1(q,sn,clear,qbar);
  nand_3 k2(qbar,rn,clear,q);
endmodule
