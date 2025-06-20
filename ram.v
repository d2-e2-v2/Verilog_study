`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2025 13:33:22
// Design Name: 
// Module Name: ram
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


module moduleName #(
    parameter addr_size=10,
     parameter word_size=8,
    parameter memory_size=1024
    )
(
    input [addr_size-1:0] addr,
    input [word_size-1:0] data_in,
    input wr,cs,
    output [word_size-1:0] data_out
);
reg  [word_size-1:0] mem [memory_size-1:0];
assign data_out=mem[addr];
always @(wr or cs)
if(wr) mem[addr]=data_in;
    
endmodule
    

