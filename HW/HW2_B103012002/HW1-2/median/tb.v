`timescale 1ns/1ps
`include "./median_syn.v"
`include "./tsmc13.v"

module tb;

reg    [7:0] a0, a1, a2;
wire   [7:0] out;

median m0 (a0, a1, a2, out);

initial begin
    a0=8'b00000000 ;a1=8'b00000000 ;a2=8'b00000000;
#10	a0=8'b10000000 ;a1=8'b00010000 ;a2=8'b00000001; //case 3'b000
#60 a0=8'b00100000 ;a1=8'b01000000 ;a2=8'b00000100; //case 3'b001
#110 a0=8'b00000010 ;a1=8'b00100000 ;a2=8'b00001000; //cade 3'b011  
#150 a0=8'b01000000 ;a1=8'b00001000 ;a2=8'b00010000; //case 3'b100
#210 a0=8'b00001000 ;a1=8'b00000010 ;a2=8'b01000000; //case 3'b110
#260 a0=8'b00000001 ;a1=8'b00001000 ;a2=8'b10000000; //case 3'b111
#310 $finish;
end

initial $monitor ($time," a0=%d a1=%d a2=%d out=%d ",a0, a1, a2, out); 
initial $sdf_annotate("median_syn.sdf",m0);
// nwave
initial begin
	$fsdbDumpfile("median.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule

