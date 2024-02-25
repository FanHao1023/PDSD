`timescale 1ns/1ps
`include "./adder_syn.v"
`include "./tsmc13.v"
 
module tb;

reg [7:0] X,Y;
reg op_mode;
wire C_out;
wire [7:0] sum;

adder add1 (X,Y,op_mode,sum,C_out);

initial begin
	X=0 ;Y=0 ;op_mode= 0;
#50 X=0 ;Y=255 ;op_mode= 1; //testing subtraction when X < Y 
#90 X=57 ;Y=27 ;op_mode= 1; //testing subtraction when X > Y
#130 X=33 ;Y=43 ;op_mode= 0; //testing addition  
#170 $finish;
end

initial $monitor ($time," sum=%d X=%d Y=%d op_mode=%d C_out=%b",sum,X,Y,op_mode,C_out); 
initial $sdf_annotate("adder_syn.sdf",add1);

// nwave
initial begin
	$fsdbDumpfile("top.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule