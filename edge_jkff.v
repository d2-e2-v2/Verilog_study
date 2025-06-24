`timescale 1ns / 1ps
// this flip-flop uses edge triggering using master slave method.
// jkflipflop used is named jkff in the repo thanks.

module ms_jkff( q,qbar,clock,clear,j,k);
input clock,clear,j,k;
output wire q,qbar;
wire q1,q1bar;
jkflipflop f1(.q(q1),.qbar(q1bar),.j(j),.k(k),.clock(clock),.clear(clear));
  sr l1(.clock(~clock),.q(q),.qbar(qbar),.set(q1),.reset(q1bar),.clear(clear)); // latch holds the value for the flipflop


endmodule
