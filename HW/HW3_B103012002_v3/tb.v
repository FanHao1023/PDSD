`timescale 1ns/1ps
`include "./traffic_light_syn.v"
`include "./tsmc13.v"

module tb;

reg    clk,reset,sel;
wire   HG,HY,HR,HL,FG,FR,FY,FL,_ST;

traffic_light traffic_light1(HG,HY,HR,HL,FG,FR,FY,FL,_ST,clk,reset,sel);

initial 
  begin
    clk=1'b0;
	reset=1'b0;
	sel=1'b0;
  end
always 
  begin
   #20 clk=~clk;
  end
initial
  begin
   #40 reset=1'b1;
   #60 reset=1'b0;
   #500 sel=1'b1;
   #500 sel=1'b0;
   #2000 $finish;
  end
  
initial $monitor ($time," HG=%b HY=%b HR=%b HL=%d FG=%b FR=%b FY=%b FL=%b _ST=%b",HG,HY,HR,HL,FG,FR,FY,FL,_ST);
initial $sdf_annotate("traffic_light.sdf",traffic_light1);

initial
  begin
   $dumpfile("traffic_light.vcd");
   $dumpvars;
  end   

// nwave
initial begin
	$fsdbDumpfile("traffic_light.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA;
end

endmodule