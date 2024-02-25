//===============================================================================//
//            PLEASE DO NOT modify basic I/O name or top module name!            // 
//===============================================================================//

module voting (a0, a1, a2, a3, a4, out);

input    [2:0]   a0, a1, a2, a3, a4;
output reg [2:0]   out;
wire s0,s1,s2,s3,s4,s5,c0,c1,c2,c3,c4,c5,cout0,cout1,cout2,error;
wire[1:0] sum0_0,sum0_1,sum1_0,sum1_1,sum2_0,sum2_1,out0,out1,out2;
wire[2:0] sum0,sum1,sum2;
//====================================================================
//======================= enter your code here =======================
full_adder fa0 (a0[0],a1[0],a2[0],s0,c0);
full_adder fa1 (a3[0],a4[0],1'b0,s1,c1);
assign sum0_0={c0,s0},
       sum0_1={c1,s1};
adder2 add0 (sum0_0,sum0_1,1'b0,out0,cout0);
assign sum0={cout0,out0};
full_adder fa2 (a0[1],a1[1],a2[1],s2,c2);
full_adder fa3 (a3[1],a4[1],1'b0,s3,c3);
assign sum1_0={c2,s2},
       sum1_1={c3,s3};
adder2 add1 (sum1_0,sum1_1,1'b0,out1,cout1);
assign sum1={cout1,out1};
full_adder fa4 (a0[2],a1[2],a2[2],s4,c4);
full_adder fa5 (a3[2],a4[2],1'b0,s5,c5);
assign sum2_0={c4,s4},
       sum2_1={c5,s5};
adder2 add2 (sum2_0,sum2_1,1'b0,out2,cout2);
assign sum2={cout2,out2};
full_adder fa6 (a0[0],a0[1],a0[2],s6,c6);
full_adder fa7 (a1[0],a1[1],a1[2],s7,c7);
full_adder fa8 (a2[0],a2[1],a2[2],s8,c8);
full_adder fa9 (a3[0],a3[1],a3[2],s9,c9);
full_adder fa10 (a4[0],a4[1],a4[2],s10,c10);
assign error=(({c6,s6}==2'b1)&({c7,s7}==2'b1)&({c8,s8}==2'b1)&({c9,s9})==2'b1)&({c10,s10}==2'b1)?1'b0:1'b1;

always@(*)
 if (error==1'b1)
  out=3'b000;
 else if (sum2>=3'd3)
  out=3'b100;
 else if (sum1>=3'd3)
  out=3'b010;
 else if (sum0>=3'd3)
  out=3'b001;
 else if (sum2==3'd2)
  out=3'b100;
 else if (sum1==3'd2)
  out=3'b010;

//====================================================================
endmodule

module half_adder (x,y,s,c);
input x,y;
output s,c;

xor(s,x,y);
and(c,x,y);

endmodule

module full_adder (x,y,z,s,c);
input x,y,z;
output s,c;

half_adder ha1(x,y,s0,c0);
half_adder ha2(s0,z,s,c1);
or(c,c0,c1);

endmodule

module adder2 (x,y,z,s,c);
input[1:0] x,y;
input z;
output[1:0]s;
output c;
wire c0;

full_adder f0(x[0],y[0],z,s[0],c0);
full_adder f1(x[1],y[1],c0,s[1],c);

endmodule 