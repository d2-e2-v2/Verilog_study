module datapath(eqz,Lda,Ldb,Ldp,Clrp,Decb,data_in,clock);
input Lda,Ldb,Ldp,Clrp,Decb,clock;
input [15:0] data_in;
output eqz;
wire [15:0] X,Y,Z,bout,bus;
assign bus=data_in;
PIPO1 A(.dout(X),.din(bus),.ld(Lda),.clock(clock)); // register with parallel in parrallel out wihtout clear
PIPO2 P(.dout(Y),.din(Z),.ld(Ldp),.clear(Clrp),.clock(clock));// pipo with clear
Adder add(.out(Z),.in1(Y),.in2(X));
CNTR B(.bout(bout),.in(bus),.ld(Ldb),.dec(Decb),.clock(clock));
Eqz comp(.iszero(eqz),.ip1(bout));
endmodule

module PIPO1(dout, din,ld,clock);
input [15:0] din;
input   ld, clock;
output  reg [15:0] dout;
always@(negedge clock)
begin
if(ld) dout<=din;
end
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
`timescale 1ns/1ps
module Eqz(iszero,ip1 );
input [15:0] ip1;
output iszero;
assign  iszero=(ip1==0);
endmodule

module CNTR (bout,in,ld,dec,clock);
input [15:0] in;
input ld,dec,clock;
output  reg [15:0]  bout;
always@(negedge clock)
begin
    if(ld)
    bout<=in;
    else if (dec)
    bout<=bout-1;
end
endmodule

module controller(eqz,clock,Lda,Ldb,Ldp,Clrp,Decb,clock,start,done);
input clock, eqz,start;
output reg Lda,Ldb,Ldp,Clrp,Decb,done;
reg [2:0] state;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;

always@(negedge clock)
begin
case(state)
S0: if(start) state<=S1;
S1: state<=S2;
S2: state<=S3;
S3 : #2 if(eqz)  state<=S4;
S4: state<=S4;
default: state<=S0;
endcase
end

always@(state)
begin
    case(state)
S0: 
begin #1 Lda=0; Ldb=0;Ldp=0;Clrp=0;Decb=0; done=0;
end
S1:   begin #1 Lda=1;end
S2: begin #1 Lda=0; Ldb=1;Clrp=1; end
S3:  begin #1  Ldp=1; Clrp=0;Ldb=0;Decb=1;end
S4:
begin #1   Ldp=0; done=1; Decb=0; Ldb=0;
end
default :  
begin #1 Lda=0; Ldb=0;Ldp=0;Clrp=0;Decb=0;
end
    endcase

end
endmodule