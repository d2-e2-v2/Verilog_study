`timescale 1ns / 1ps

module MUL_dataphath(eqz,Lda,Ldb,Ldp,Clrp,Decb,data_in,clock);
input Lda,Ldb,Ldp,Clrp,Decb,clock;
input [15:0] data_in;
output eqz;
wire [15:0] X,Y,Z,bout,bus;
assign bus=data_in;
PIPO1 A(.dout(X),.din(bus),.ld(Lda),.clock(clock)); // register with parallel in parrallel out wihtout clear
PIPO2 P(.dout(Y),.din(Z),.ld(Ldp),.clear(Clrp),.clock(clock));// pipo with clear
Adder add(.out(Z),.in1(Y),.in2(X));
CNTR B(.dout(Bout),.in(Bus),.ld(Ldb),.dec(decB),.clock(clock));
Eqz comp(.iszero(eqz),.in(bout));
endmodule

module PIPO1(dout, din,ld,clock);
input [15:0] din;
input   ld, clock;
output  reg [15:0] X;
always@(negedge clock)
dout <= ld ? din: 16'b0;
endmodule

module Adder(out,in1,in2);
input [15:0] in1,in2;
output reg [15:0] out;
always@(*)
out=in1+in2;
endmodule

module PIPO2(dout,din,clear,clock,ld );
input [15:0]din;
input clock,clear,ld;
output reg [15:0] dout;
always @(negedge clock)
begin
    if(clear) dout<=16'b0;
    else if(ld) dout<=din;
end 
endmodule

module Eqz(iszero,ip );
input [15:0] ip;
output eqz;
assign  eqz=!(|ip);
endmodule

module CNTR (dout,in,ld,dec,clock);
input [15:0] in;
input ld,dec,clock;
output [15:0]  reg dout;
always@(*)
begin
    if(ld)
    dout<=in;
    else if(dec)
    dout<=dout-1;
end
endmodule

module controller(eqz,Lda,Ldb,Ldp,Clrp,Decb,clock,start,done);
input clock, eqz,start;
output reg Lda,Ldb,Ldp,Clrp,decb,done;
reg [2:0] state;
parameter S0=3'b0,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;

always@(negedge clock)
begin
case(state)
S0: if(start) state<=S1;
S1: state<=S2;
S2: state<=S3;
S3 : if(eqz) #2 state<=S4;
S4: state<=S4;
default: state<=S0;
endcase
end

always@(state)
begin
    case(state)
S0: #1
begin 
 Lda=0; Ldb=0;Ldp=0;Clrp=0;Decb=0;
end
S1:  #1 begin
     Lda=1;
end
S2: #1 begin
   Lda=0; Ldb=1;Clrp=1; 
end
S3: #1 begin
     Ldp=1; Clr=0;Ldb=0;Decb=1;
end
S4: #1
begin
Ldp=0; done=1; Decb=0;
end
default :  #1
begin 
 Lda=0; Ldb=0;Ldp=0;Clrp=0;Decb=0;
end
    endcase

end
endmodule






 
