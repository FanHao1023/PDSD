/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Apr 16 00:29:08 2023
/////////////////////////////////////////////////////////////


module half_adder_0 ( x, y, s, c );
  input x, y;
  output s, c;


  XOR2X1 U1 ( .A(y), .B(x), .Y(s) );
  AND2X1 U2 ( .A(y), .B(x), .Y(c) );
endmodule


module half_adder_15 ( x, y, s, c );
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
  half_adder_15 ha2 ( .x(s0), .y(z), .s(s), .c(c1) );
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


module adder ( X, Y, op_mode, sum, C_out );
  input [7:0] X;
  input [7:0] Y;
  output [7:0] sum;
  input op_mode;
  output C_out;
  wire   _Y0, _Y1, _Y2, _Y3, _Y4, _Y5, _Y6, _Y7, c0, c1, c2, c3, c4, c5, c6;

  full_adder_0 fa0 ( .x(X[0]), .y(_Y0), .z(op_mode), .s(sum[0]), .c(c0) );
  full_adder_7 fa1 ( .x(X[1]), .y(_Y1), .z(c0), .s(sum[1]), .c(c1) );
  full_adder_6 fa2 ( .x(X[2]), .y(_Y2), .z(c1), .s(sum[2]), .c(c2) );
  full_adder_5 fa3 ( .x(X[3]), .y(_Y3), .z(c2), .s(sum[3]), .c(c3) );
  full_adder_4 fa4 ( .x(X[4]), .y(_Y4), .z(c3), .s(sum[4]), .c(c4) );
  full_adder_3 fa5 ( .x(X[5]), .y(_Y5), .z(c4), .s(sum[5]), .c(c5) );
  full_adder_2 fa6 ( .x(X[6]), .y(_Y6), .z(c5), .s(sum[6]), .c(c6) );
  full_adder_1 fa7 ( .x(X[7]), .y(_Y7), .z(c6), .s(sum[7]), .c(C_out) );
  XOR2X1 U9 ( .A(op_mode), .B(Y[7]), .Y(_Y7) );
  XOR2X1 U10 ( .A(op_mode), .B(Y[6]), .Y(_Y6) );
  XOR2X1 U11 ( .A(op_mode), .B(Y[5]), .Y(_Y5) );
  XOR2X1 U12 ( .A(op_mode), .B(Y[4]), .Y(_Y4) );
  XOR2X1 U13 ( .A(op_mode), .B(Y[3]), .Y(_Y3) );
  XOR2X1 U14 ( .A(op_mode), .B(Y[2]), .Y(_Y2) );
  XOR2X1 U15 ( .A(op_mode), .B(Y[1]), .Y(_Y1) );
  XOR2X1 U16 ( .A(op_mode), .B(Y[0]), .Y(_Y0) );
endmodule

