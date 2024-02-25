`timescale 1ns/10ps
`include "./top.v"
module tb;

reg [7:0] X,Y;
reg op_mode;
wire C_out,Overflow;
wire [7:0] SUM;

adder adder1 (X,Y,op_mode,SUM,C_out,Overflow);

initial begin
	X=0 ;Y=0 ;op_mode= 0;
#10 X=125 ;Y=123 ;op_mode= 0; //testing overflow
#60 X=0 ;Y=255 ;op_mode= 1; //testing subtraction when X < Y
#110 X=73 ;Y= 43;op_mode= 1; //testing subtraction when X > Y 
#160 X=25 ;Y=23 ;op_mode= 0; //testing addition
#210 $finish;
end

initial $monitor ($time," SUM=%d X=%d Y=%d op_mode=%d C_out=%b Overflow=%b",SUM,X,Y,op_mode,C_out,Overflow); 

// nwave
initial begin
	$fsdbDumpfile("top.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule