`timescale 1ns / 1ps
module al(ip1, ip2, sum, cout, zero, parity, overflow);
  input [15:0] ip1, ip2;
  output [15:0] sum;
  output cout, zero, overflow, parity;
  wire line[2:0];
   bits4adder a1(.ip1(ip1[3:0]),.ip2(ip2[3:0]),.sum(sum[3:0]),.cout(line[0]),.cin(0) );
   bits4adder aw(.ip1(ip1[7:4]),.ip2(ip2[7:4]),.sum(sum[7:4]),.cout(line[1]),.cin(line[0]) );
   bits4adder ak(.ip1(ip1[11:8]),.ip2(ip2[11:8]),.sum(sum[11:8]),.cout(line[2]),.cin(line[1]) );
   bits4adder as(.ip1(ip1[15:12]),.ip2(ip2[15:12]),.sum(sum[15:12]),.cout(cout),.cin(line[2]) );

  assign parity = ~^sum;
  assign zero = ~|sum;

  assign overflow = (ip1[15] & ip2[15] & ~sum[15]) |
                    (~ip1[15] & ~ip2[15] & sum[15]);
endmodule
