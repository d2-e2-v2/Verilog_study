`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2025 16:52:20
// Design Name: 
// Module Name: seqdec
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


module seqdec (in,clock,out);
input wire in,clock;
output  reg out;
reg [1:0] state,nextstate;
parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
always@(posedge clock)
begin
    state<=nextstate;
end

always@(state)
begin
case(state)
    s0:
     #1 begin
      nextstate<=in ? s0:s1;
    end
    s1:
     #1 begin
        nextstate<= in ? s2:s1 ;
    end
    s2:
     #1 begin
        nextstate <= in ? s1:s3;
    end
    s3:
     #1 begin
        nextstate<= in ? s0:s1;
    end
    default: #1 begin
     state<=s0;
     end
endcase
end
always@(state)
begin
case(state)
s3: #1 begin
out<= in ? 1:0;
end
default: #1 begin
out<=0;
end
endcase
end



endmodule
