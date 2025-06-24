`timescale 1ps / 1ps

//  A basic strucrutal jk flip flop
module jkflipflop(q,qbar,j,k,clock,clear); // this will use nand.
input  j,k,clock,clear;
output wire q,qbar;
wire intq,intq2;
   

nand k1222(.out(intq),.in1(j),.in2(clock),.in3(qbar));
nand K222(.out(intq2),.in1(k),.in2(clock),.in3(q));
nand j1( q,intq,qbar,clear);
nand j2(qbar,intq2,q,clear);

endmodule

