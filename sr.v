`timescale 1ns / 1ps
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
  nand k1(q,sn,clear,qbar);
  nand k2(qbar,rn,clear,q);
endmodule
