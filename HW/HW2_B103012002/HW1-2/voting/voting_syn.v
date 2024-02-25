/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Apr 16 12:32:15 2023
/////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module half_adder_0 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_23 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_0 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_0 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_23 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_9 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_10 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_5 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_10 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_9 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_11 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_12 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_6 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_12 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_11 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module adder2_0 ( x, y, z, s, c );
  input [1:0] x;
  input [1:0] y;
  output [1:0] s;
  input z;
  output c;
  wire   c0;

  full_adder_6 f0 ( .x(x[0]), .y(y[0]), .z(z), .s(s[0]), .c(c0) );
  full_adder_5 f1 ( .x(x[1]), .y(y[1]), .z(c0), .s(s[1]), .c(c) );
endmodule


module half_adder_13 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_14 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_7 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_14 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_13 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_15 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_16 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_8 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_16 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_15 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_17 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_18 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_9 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_18 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_17 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_19 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_20 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_10 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_20 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_19 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_21 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_22 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_11 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_22 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_21 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_1 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_2 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_1 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_2 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_1 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_3 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_4 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_2 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_4 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_3 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module adder2_1 ( x, y, z, s, c );
  input [1:0] x;
  input [1:0] y;
  output [1:0] s;
  input z;
  output c;
  wire   c0;

  full_adder_2 f0 ( .x(x[0]), .y(y[0]), .z(z), .s(s[0]), .c(c0) );
  full_adder_1 f1 ( .x(x[1]), .y(y[1]), .z(c0), .s(s[1]), .c(c) );
endmodule


module half_adder_5 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_6 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_3 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_6 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_5 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module half_adder_7 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_8 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module full_adder_4 ( x, y, z, s, c );
  input x, y, z;
  output s, c;
  wire   s0, c0, c1;

  half_adder_8 ha1 ( .x(x), .y(y), .s(s0), .c(c0) );
  half_adder_7 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
  OR2X1 U1 ( .A(c0), .B(c1), .Y(c) );
endmodule


module adder2_2 ( x, y, z, s, c );
  input [1:0] x;
  input [1:0] y;
  output [1:0] s;
  input z;
  output c;
  wire   c0;

  full_adder_4 f0 ( .x(x[0]), .y(y[0]), .z(z), .s(s[0]), .c(c0) );
  full_adder_3 f1 ( .x(x[1]), .y(y[1]), .z(c0), .s(s[1]), .c(c) );
endmodule


module voting ( a0, a1, a2, a3, a4, out );
  input [2:0] a0;
  input [2:0] a1;
  input [2:0] a2;
  input [2:0] a3;
  input [2:0] a4;
  output [2:0] out;
  wire   \sum0[2] , \sum1[2] , \sum2[2] , n23, n24, n25, n26, n27, n28, n29,
         n30;
  wire   [1:0] sum0_0;
  wire   [1:0] sum0_1;
  wire   [1:0] out0;
  wire   [1:0] sum1_0;
  wire   [1:0] sum1_1;
  wire   [1:0] out1;
  wire   [1:0] sum2_0;
  wire   [1:0] sum2_1;
  wire   [1:0] out2;

  full_adder_0 fa0 ( .x(a0[0]), .y(a1[0]), .z(a2[0]), .s(sum0_0[0]), .c(
        sum0_0[1]) );
  full_adder_11 fa1 ( .x(a3[0]), .y(a4[0]), .z(1'b0), .s(sum0_1[0]), .c(
        sum0_1[1]) );
  adder2_0 add0 ( .x(sum0_0), .y(sum0_1), .z(1'b0), .s(out0), .c(\sum0[2] ) );
  full_adder_10 fa2 ( .x(a0[1]), .y(a1[1]), .z(a2[1]), .s(sum1_0[0]), .c(
        sum1_0[1]) );
  full_adder_9 fa3 ( .x(a3[1]), .y(a4[1]), .z(1'b0), .s(sum1_1[0]), .c(
        sum1_1[1]) );
  adder2_2 add1 ( .x(sum1_0), .y(sum1_1), .z(1'b0), .s(out1), .c(\sum1[2] ) );
  full_adder_8 fa4 ( .x(a0[2]), .y(a1[2]), .z(a2[2]), .s(sum2_0[0]), .c(
        sum2_0[1]) );
  full_adder_7 fa5 ( .x(a3[2]), .y(a4[2]), .z(1'b0), .s(sum2_1[0]), .c(
        sum2_1[1]) );
  adder2_1 add2 ( .x(sum2_0), .y(sum2_1), .z(1'b0), .s(out2), .c(\sum2[2] ) );
  NAND2BX1 U16 ( .AN(n23), .B(n24), .Y(out[2]) );
  NAND4X1 U17 ( .A(n25), .B(out2[1]), .C(n26), .D(n27), .Y(n24) );
  NOR2X1 U18 ( .A(n28), .B(n23), .Y(out[1]) );
  AOI31X1 U19 ( .A0(out1[1]), .A1(n29), .A2(n25), .B0(n30), .Y(n28) );
  CLKINVX1 U20 ( .A(out2[1]), .Y(n29) );
  NOR3X1 U21 ( .A(n30), .B(n25), .C(n23), .Y(out[0]) );
  AO21X1 U22 ( .A0(out2[1]), .A1(out2[0]), .B0(\sum2[2] ), .Y(n23) );
  AOI21X1 U23 ( .A0(out0[1]), .A1(out0[0]), .B0(\sum0[2] ), .Y(n25) );
  NAND2X1 U24 ( .A(n27), .B(n26), .Y(n30) );
  NAND2X1 U25 ( .A(out1[1]), .B(out1[0]), .Y(n26) );
  CLKINVX1 U26 ( .A(\sum1[2] ), .Y(n27) );
endmodule

