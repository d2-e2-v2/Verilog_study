`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2025 13:51:18
// Design Name: 
// Module Name: fsm_parity
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


module fsm_parity (in,out,clock );
input clock,in;  
output reg out;
reg even_odd;
parameter EVEN=0;
parameter ODD=1;
always@(negedge clock)
begin 
    case(even_odd)
    
    EVEN:
    even_odd<= in ? ODD:EVEN;
        
    ODD:
    even_odd <= in ? EVEN:ODD;
     
  default: even_odd<=EVEN;
endcase
end

always@( even_odd)
begin
case(even_odd)
EVEN: out=1;
ODD: out=0;
endcase
end
endmodule
