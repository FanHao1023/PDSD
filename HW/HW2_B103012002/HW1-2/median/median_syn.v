/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sun Apr 16 12:07:30 2023
/////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module median ( a0, a1, a2, out );
  input [7:0] a0;
  input [7:0] a1;
  input [7:0] a2;
  output [7:0] out;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58;

  OAI222XL U6 ( .A0(n4), .A1(n5), .B0(n6), .B1(n7), .C0(n8), .C1(n9), .Y(
        out[7]) );
  OAI222XL U7 ( .A0(n4), .A1(n10), .B0(n6), .B1(n11), .C0(n8), .C1(n12), .Y(
        out[6]) );
  OAI222XL U8 ( .A0(n4), .A1(n13), .B0(n6), .B1(n14), .C0(n8), .C1(n15), .Y(
        out[5]) );
  OAI222XL U9 ( .A0(n4), .A1(n16), .B0(n6), .B1(n17), .C0(n8), .C1(n18), .Y(
        out[4]) );
  OAI222XL U10 ( .A0(n4), .A1(n19), .B0(n6), .B1(n20), .C0(n8), .C1(n21), .Y(
        out[3]) );
  OAI222XL U11 ( .A0(n4), .A1(n22), .B0(n6), .B1(n23), .C0(n8), .C1(n24), .Y(
        out[2]) );
  OAI222XL U12 ( .A0(n4), .A1(n25), .B0(n6), .B1(n26), .C0(n8), .C1(n27), .Y(
        out[1]) );
  OAI21XL U13 ( .A0(n8), .A1(n28), .B0(n29), .Y(out[0]) );
  AOI2BB2X1 U14 ( .B0(a2[0]), .B1(n30), .A0N(n6), .A1N(n31), .Y(n29) );
  XOR2X1 U15 ( .A(n32), .B(n33), .Y(n6) );
  CLKINVX1 U16 ( .A(n4), .Y(n30) );
  XOR2X1 U17 ( .A(n32), .B(n34), .Y(n4) );
  OAI21XL U18 ( .A0(a1[7]), .A1(n5), .B0(n35), .Y(n32) );
  OAI21XL U19 ( .A0(a2[7]), .A1(n7), .B0(n36), .Y(n35) );
  OAI21XL U20 ( .A0(a1[6]), .A1(n10), .B0(n37), .Y(n36) );
  OAI221XL U21 ( .A0(a2[5]), .A1(n14), .B0(a2[6]), .B1(n11), .C0(n38), .Y(n37)
         );
  OAI221XL U22 ( .A0(a1[4]), .A1(n16), .B0(a1[5]), .B1(n13), .C0(n39), .Y(n38)
         );
  OAI221XL U23 ( .A0(a2[3]), .A1(n20), .B0(a2[4]), .B1(n17), .C0(n40), .Y(n39)
         );
  OAI221XL U24 ( .A0(a1[2]), .A1(n22), .B0(a1[3]), .B1(n19), .C0(n41), .Y(n40)
         );
  OAI222XL U25 ( .A0(n31), .A1(n26), .B0(a2[1]), .B1(n42), .C0(a2[2]), .C1(n23), .Y(n41) );
  NOR2X1 U26 ( .A(a1[1]), .B(a1[0]), .Y(n42) );
  CLKINVX1 U27 ( .A(a1[1]), .Y(n26) );
  CLKINVX1 U28 ( .A(a1[0]), .Y(n31) );
  XOR2X1 U29 ( .A(n33), .B(n34), .Y(n8) );
  OA21XL U30 ( .A0(a0[7]), .A1(n5), .B0(n43), .Y(n34) );
  OAI22XL U31 ( .A0(n44), .A1(n45), .B0(a2[7]), .B1(n9), .Y(n43) );
  AOI221XL U32 ( .A0(a0[6]), .A1(n10), .B0(a0[5]), .B1(n13), .C0(n46), .Y(n45)
         );
  AOI221XL U33 ( .A0(a2[5]), .A1(n15), .B0(a2[4]), .B1(n18), .C0(n47), .Y(n46)
         );
  AOI221XL U34 ( .A0(a0[4]), .A1(n16), .B0(a0[3]), .B1(n19), .C0(n48), .Y(n47)
         );
  AOI221XL U35 ( .A0(a2[3]), .A1(n21), .B0(a2[2]), .B1(n24), .C0(n49), .Y(n48)
         );
  AOI222XL U36 ( .A0(a0[2]), .A1(n22), .B0(a0[0]), .B1(n50), .C0(a0[1]), .C1(
        n25), .Y(n49) );
  CLKINVX1 U37 ( .A(a2[1]), .Y(n25) );
  NAND2X1 U38 ( .A(a2[1]), .B(n27), .Y(n50) );
  CLKINVX1 U39 ( .A(a2[2]), .Y(n22) );
  CLKINVX1 U40 ( .A(a2[3]), .Y(n19) );
  CLKINVX1 U41 ( .A(a2[4]), .Y(n16) );
  CLKINVX1 U42 ( .A(a2[5]), .Y(n13) );
  NOR2X1 U43 ( .A(a0[6]), .B(n10), .Y(n44) );
  CLKINVX1 U44 ( .A(a2[6]), .Y(n10) );
  CLKINVX1 U45 ( .A(a2[7]), .Y(n5) );
  OAI21XL U46 ( .A0(a0[7]), .A1(n7), .B0(n51), .Y(n33) );
  OAI21XL U47 ( .A0(a1[7]), .A1(n9), .B0(n52), .Y(n51) );
  OAI21XL U48 ( .A0(a0[6]), .A1(n11), .B0(n53), .Y(n52) );
  OAI221XL U49 ( .A0(a1[5]), .A1(n15), .B0(a1[6]), .B1(n12), .C0(n54), .Y(n53)
         );
  OAI221XL U50 ( .A0(a0[4]), .A1(n17), .B0(a0[5]), .B1(n14), .C0(n55), .Y(n54)
         );
  OAI221XL U51 ( .A0(a1[3]), .A1(n21), .B0(a1[4]), .B1(n18), .C0(n56), .Y(n55)
         );
  OAI221XL U52 ( .A0(a0[2]), .A1(n23), .B0(a0[3]), .B1(n20), .C0(n57), .Y(n56)
         );
  OAI222XL U53 ( .A0(n28), .A1(n27), .B0(a1[1]), .B1(n58), .C0(a1[2]), .C1(n24), .Y(n57) );
  CLKINVX1 U54 ( .A(a0[2]), .Y(n24) );
  NOR2X1 U55 ( .A(a0[1]), .B(a0[0]), .Y(n58) );
  CLKINVX1 U56 ( .A(a0[1]), .Y(n27) );
  CLKINVX1 U57 ( .A(a0[0]), .Y(n28) );
  CLKINVX1 U58 ( .A(a1[3]), .Y(n20) );
  CLKINVX1 U59 ( .A(a1[2]), .Y(n23) );
  CLKINVX1 U60 ( .A(a0[4]), .Y(n18) );
  CLKINVX1 U61 ( .A(a0[3]), .Y(n21) );
  CLKINVX1 U62 ( .A(a1[5]), .Y(n14) );
  CLKINVX1 U63 ( .A(a1[4]), .Y(n17) );
  CLKINVX1 U64 ( .A(a0[6]), .Y(n12) );
  CLKINVX1 U65 ( .A(a0[5]), .Y(n15) );
  CLKINVX1 U66 ( .A(a1[6]), .Y(n11) );
  CLKINVX1 U67 ( .A(a0[7]), .Y(n9) );
  CLKINVX1 U68 ( .A(a1[7]), .Y(n7) );
endmodule

