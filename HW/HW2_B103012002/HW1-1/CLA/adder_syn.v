/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Apr 16 10:25:06 2023
/////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module CLadder_4_0 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  XOR2X1 U1 ( .A(n1), .B(cout), .Y(sum[3]) );
  XOR2X1 U2 ( .A(n2), .B(n3), .Y(sum[2]) );
  XOR2X1 U3 ( .A(n4), .B(n5), .Y(sum[1]) );
  XOR2X1 U4 ( .A(cin), .B(n6), .Y(sum[0]) );
  AO22X1 U5 ( .A0(a[3]), .A1(b[3]), .B0(n1), .B1(n7), .Y(cout) );
  OAI2BB2XL U6 ( .B0(n3), .B1(n2), .A0N(b[2]), .A1N(a[2]), .Y(n7) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n2) );
  OA21XL U8 ( .A0(n5), .A1(n4), .B0(n8), .Y(n3) );
  OAI21XL U9 ( .A0(b[1]), .A1(a[1]), .B0(n8), .Y(n4) );
  NAND2X1 U10 ( .A(b[1]), .B(a[1]), .Y(n8) );
  AOI22X1 U11 ( .A0(n6), .A1(cin), .B0(a[0]), .B1(b[0]), .Y(n5) );
  XOR2X1 U12 ( .A(a[0]), .B(b[0]), .Y(n6) );
  XOR2X1 U13 ( .A(a[3]), .B(b[3]), .Y(n1) );
endmodule


module CLadder_4_1 ( a, b, cin, sum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input cin;
  output cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  XOR2X1 U1 ( .A(n1), .B(cout), .Y(sum[3]) );
  XOR2X1 U2 ( .A(n2), .B(n3), .Y(sum[2]) );
  XOR2X1 U3 ( .A(n4), .B(n5), .Y(sum[1]) );
  XOR2X1 U4 ( .A(cin), .B(n6), .Y(sum[0]) );
  AO22X1 U5 ( .A0(a[3]), .A1(b[3]), .B0(n1), .B1(n7), .Y(cout) );
  OAI2BB2XL U6 ( .B0(n3), .B1(n2), .A0N(b[2]), .A1N(a[2]), .Y(n7) );
  XNOR2X1 U7 ( .A(a[2]), .B(b[2]), .Y(n2) );
  OA21XL U8 ( .A0(n5), .A1(n4), .B0(n8), .Y(n3) );
  OAI21XL U9 ( .A0(b[1]), .A1(a[1]), .B0(n8), .Y(n4) );
  NAND2X1 U10 ( .A(b[1]), .B(a[1]), .Y(n8) );
  AOI22X1 U11 ( .A0(n6), .A1(cin), .B0(a[0]), .B1(b[0]), .Y(n5) );
  XOR2X1 U12 ( .A(a[0]), .B(b[0]), .Y(n6) );
  XOR2X1 U13 ( .A(a[3]), .B(b[3]), .Y(n1) );
endmodule


module adder ( X, Y, op_mode, sum, C_out );
  input [7:0] X;
  input [7:0] Y;
  output [7:0] sum;
  input op_mode;
  output C_out;
  wire   c0;
  wire   [7:0] _Y;

  CLadder_4_0 add0 ( .a(X[3:0]), .b(_Y[3:0]), .cin(op_mode), .sum(sum[3:0]), 
        .cout(c0) );
  CLadder_4_1 add1 ( .a(X[7:4]), .b(_Y[7:4]), .cin(c0), .sum(sum[7:4]), .cout(
        C_out) );
  XOR2X1 U9 ( .A(op_mode), .B(Y[7]), .Y(_Y[7]) );
  XOR2X1 U10 ( .A(op_mode), .B(Y[6]), .Y(_Y[6]) );
  XOR2X1 U11 ( .A(op_mode), .B(Y[5]), .Y(_Y[5]) );
  XOR2X1 U12 ( .A(op_mode), .B(Y[4]), .Y(_Y[4]) );
  XOR2X1 U13 ( .A(op_mode), .B(Y[3]), .Y(_Y[3]) );
  XOR2X1 U14 ( .A(op_mode), .B(Y[2]), .Y(_Y[2]) );
  XOR2X1 U15 ( .A(op_mode), .B(Y[1]), .Y(_Y[1]) );
  XOR2X1 U16 ( .A(op_mode), .B(Y[0]), .Y(_Y[0]) );
endmodule

