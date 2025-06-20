`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:06:16
// Design Name: 
// Module Name: 4bitadder
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

module bits4adder(ip1,ip2,cin, sum,cout);
    input [3:0] ip1,ip2;
    input cin;
    output [3:0] sum;
    wire [2:0] carry;
    output cout;
    fulladdertop a1(.sum1(sum[0]),.cin1(cin),.a1(ip1[0]),.b1(ip2[0]),.cout1(carry[0]) );
    fulladdertop a2(.sum1(sum[1]),.cin1(carry[0]),.a1(ip1[1]),.b1(ip2[1]),.cout1(carry[1]) );
    fulladdertop a4(.sum1(sum[2]),.cin1(carry[1]),.a1(ip1[2]),.b1(ip2[2]),.cout1(carry[2]) );
    fulladdertop a3(.sum1(sum[3]),.cin1(carry[2]),.a1(ip1[3]),.b1(ip2[3]),.cout1(cout) );

endmodule

