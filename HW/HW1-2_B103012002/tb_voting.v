`timescale 1ns/10ps
`include "./voting.v"
module tb;

reg    [2:0] a0, a1, a2, a3, a4;
wire   [2:0] out;

voting v0 (a0, a1, a2, a3, a4, out);

initial begin
	a0=3'b000 ;a1=3'b000 ;a2=3'b000 ;a3=3'b000 ;a4=3'b000; 
#10 a0=3'b100 ;a1=3'b100 ;a2=3'b100 ;a3=3'b100 ;a4=3'b100; 
#60 a0=3'b100 ;a1=3'b100 ;a2=3'b100 ;a3=3'b100 ;a4=3'b010; 
#110 a0=3'b100 ;a1=3'b100 ;a2=3'b100 ;a3=3'b010 ;a4=3'b010; 
#160 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b010 ;a4=3'b010;
#210 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b010 ;a4=3'b100;
#260 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b100 ;a4=3'b100;
#310 a0=3'b001 ;a1=3'b001 ;a2=3'b001 ;a3=3'b001 ;a4=3'b001;
#360 a0=3'b001 ;a1=3'b001 ;a2=3'b001 ;a3=3'b001 ;a4=3'b010;
#410 a0=3'b001 ;a1=3'b001 ;a2=3'b001 ;a3=3'b100 ;a4=3'b010;
#460 a0=3'b100 ;a1=3'b100 ;a2=3'b010 ;a3=3'b010 ;a4=3'b001;
#510 a0=3'b010 ;a1=3'b010 ;a2=3'b100 ;a3=3'b001 ;a4=3'b001;
#560 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b010 ;a4=3'b000;
#610 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b010 ;a4=3'b011;
#660 $finish;
end

initial $monitor ($time," a0=%b a1=%b a2=%b a3=%b a4=%b out=%b ",a0, a1, a2, a3, a4, out); 

// nwave
initial begin
	$fsdbDumpfile("voting.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule
