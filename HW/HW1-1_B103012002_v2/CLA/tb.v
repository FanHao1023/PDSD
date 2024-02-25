`timescale 1ns/10ps
`include "./top.v"
module tb;

reg [7:0] X,Y;
reg op_mode;
wire C_out,Overflow;
wire [7:0] SUM;

adder add1 (X,Y,op_mode,SUM,C_out,Overflow);

initial begin
	X=0 ;Y=0 ;op_mode= 0;
#10 X=125 ;Y=123 ;op_mode= 0; //testing Overflow
#50 X=0 ;Y=255 ;op_mode= 1; //testing subtraction when X < Y 
#90 X=57 ;Y=27 ;op_mode= 1; //testing subtraction when X > Y
#130 X=33 ;Y=43 ;op_mode= 0; //testing addition  
#170 $finish;
end

initial $monitor ($time," SUM=%d X=%d Y=%d op_mode=%d C_out=%b Overflow=%b",SUM,X,Y,op_mode,C_out,Overflow); 

// nwave
initial begin
	$fsdbDumpfile("top.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule