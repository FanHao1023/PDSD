`timescale 1ns/1ps
`include "./voting_syn.v"
`include "./tsmc13.v"

module tb;

reg    [2:0] a0, a1, a2, a3, a4;
wire   [2:0] out;

voting v0 (a0, a1, a2, a3, a4, out);

initial begin
	a0=3'b000 ;a1=3'b000 ;a2=3'b000 ;a3=3'b000 ;a4=3'b000; 
#10 a0=3'b100 ;a1=3'b100 ;a2=3'b100 ;a3=3'b100 ;a4=3'b100; 
#40 a0=3'b100 ;a1=3'b100 ;a2=3'b100 ;a3=3'b100 ;a4=3'b010; 
#70 a0=3'b100 ;a1=3'b100 ;a2=3'b100 ;a3=3'b010 ;a4=3'b010; 
#100 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b010 ;a4=3'b010;
#130 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b010 ;a4=3'b100;
#160 a0=3'b010 ;a1=3'b010 ;a2=3'b010 ;a3=3'b100 ;a4=3'b100;
#190 a0=3'b001 ;a1=3'b001 ;a2=3'b001 ;a3=3'b001 ;a4=3'b001;
#220 a0=3'b001 ;a1=3'b001 ;a2=3'b001 ;a3=3'b001 ;a4=3'b010;
#250 a0=3'b001 ;a1=3'b001 ;a2=3'b001 ;a3=3'b100 ;a4=3'b010;
#280 a0=3'b100 ;a1=3'b100 ;a2=3'b010 ;a3=3'b010 ;a4=3'b001;
#310 a0=3'b010 ;a1=3'b010 ;a2=3'b100 ;a3=3'b001 ;a4=3'b001;
#340 $finish;
end

initial $monitor ($time," a0=%b a1=%b a2=%b a3=%b a4=%b out=%b ",a0, a1, a2, a3, a4, out); 
initial $sdf_annotate("voting_syn.sdf",v0);
// nwave
initial begin
	$fsdbDumpfile("voting.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule
