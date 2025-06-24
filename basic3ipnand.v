`timescale 1ps / 1ps


module nand_3(out,in1,in2,in3);
input in1,in2,in3;
output out;
wire stuff,inverted;
nand n1(stuff,in1,in2);
not not1(inverted,stuff);
nand n2(out,inverted,in3);

endmodule
