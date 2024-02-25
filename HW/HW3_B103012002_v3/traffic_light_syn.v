/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Tue May  9 00:43:01 2023
/////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module traffic_light ( HG, HY, HR, HL, FG, FR, FY, FL, _ST, clk, reset, sel );
  input clk, reset, sel;
  output HG, HY, HR, HL, FG, FR, FY, FL, _ST;
  wire   N11, N12, N13, ST, N40, N44, N48, N51, N55, N58, n2, n3, n4, n5, n9,
         n10, n11, n12, n13, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34;
  wire   [2:0] state;
  wire   [3:0] count;
  wire   [2:0] n_state;
  assign HG = N40;
  assign HY = N44;
  assign HL = N48;
  assign FG = N51;
  assign FY = N55;
  assign FL = N58;

  CLKINVX1 U4 ( .A(reset), .Y(n2) );
  DFFRX1 _ST_reg ( .D(ST), .CK(clk), .RN(n2), .Q(_ST) );
  DFFRX1 \count_reg[1]  ( .D(N11), .CK(clk), .RN(n34), .Q(count[1]), .QN(n30)
         );
  DFFRX1 \count_reg[3]  ( .D(N13), .CK(clk), .RN(n34), .Q(count[3]), .QN(n32)
         );
  DFFRX1 \count_reg[2]  ( .D(N12), .CK(clk), .RN(n34), .Q(count[2]) );
  DFFRX1 \state_reg[1]  ( .D(n_state[1]), .CK(clk), .RN(n2), .Q(state[1]), 
        .QN(n31) );
  DFFRX1 \state_reg[0]  ( .D(n_state[0]), .CK(clk), .RN(n2), .Q(state[0]), 
        .QN(n29) );
  DFFRX1 \count_reg[0]  ( .D(n33), .CK(clk), .RN(n34), .Q(count[0]), .QN(n33)
         );
  DFFRX1 \state_reg[2]  ( .D(n_state[2]), .CK(clk), .RN(n2), .Q(state[2]) );
  CLKINVX1 U47 ( .A(n20), .Y(n5) );
  NAND2X1 U48 ( .A(n25), .B(n32), .Y(n20) );
  NOR2X1 U49 ( .A(n29), .B(n16), .Y(N55) );
  NOR2X1 U50 ( .A(n31), .B(n29), .Y(n26) );
  CLKINVX1 U51 ( .A(N51), .Y(n9) );
  OAI221XL U52 ( .A0(n5), .A1(n16), .B0(n9), .B1(n17), .C0(n13), .Y(n_state[2]) );
  CLKINVX1 U53 ( .A(N58), .Y(n13) );
  OAI211X1 U54 ( .A0(n19), .A1(n10), .B0(n21), .C0(n23), .Y(ST) );
  AOI22X1 U55 ( .A0(N55), .A1(n5), .B0(n3), .B1(N51), .Y(n23) );
  OAI211X1 U56 ( .A0(n4), .A1(n10), .B0(n21), .C0(n22), .Y(n_state[0]) );
  AOI22X1 U57 ( .A0(N55), .A1(n20), .B0(N51), .B1(n17), .Y(n22) );
  CLKINVX1 U58 ( .A(n19), .Y(n4) );
  CLKINVX1 U59 ( .A(n17), .Y(n3) );
  CLKINVX1 U60 ( .A(N48), .Y(n10) );
  NOR2BX1 U61 ( .AN(n26), .B(state[2]), .Y(N51) );
  NOR3X1 U62 ( .A(count[0]), .B(count[2]), .C(n30), .Y(n25) );
  NOR3X1 U63 ( .A(state[0]), .B(state[2]), .C(n31), .Y(N44) );
  NOR3X1 U64 ( .A(state[1]), .B(state[2]), .C(n29), .Y(N48) );
  NOR3X1 U65 ( .A(state[1]), .B(state[2]), .C(state[0]), .Y(N40) );
  XNOR2X1 U66 ( .A(count[2]), .B(n28), .Y(N12) );
  NAND4X1 U67 ( .A(count[2]), .B(count[0]), .C(n30), .D(n32), .Y(n19) );
  NAND2X1 U68 ( .A(state[2]), .B(n31), .Y(n16) );
  NOR2X1 U69 ( .A(n16), .B(state[0]), .Y(N58) );
  NAND2X1 U70 ( .A(count[3]), .B(n25), .Y(n17) );
  NAND2X1 U71 ( .A(count[1]), .B(count[0]), .Y(n28) );
  OAI222XL U72 ( .A0(n3), .A1(n9), .B0(n18), .B1(n11), .C0(n19), .C1(n10), .Y(
        n_state[1]) );
  CLKINVX1 U73 ( .A(N44), .Y(n11) );
  NOR2X1 U74 ( .A(sel), .B(n20), .Y(n18) );
  OA21XL U75 ( .A0(n17), .A1(n12), .B0(n24), .Y(n21) );
  CLKINVX1 U76 ( .A(N40), .Y(n12) );
  AOI32X1 U77 ( .A0(N44), .A1(n5), .A2(sel), .B0(N58), .B1(n4), .Y(n24) );
  XOR2X1 U78 ( .A(count[3]), .B(n27), .Y(N13) );
  NOR2BX1 U79 ( .AN(count[2]), .B(n28), .Y(n27) );
  XOR2X1 U80 ( .A(count[1]), .B(count[0]), .Y(N11) );
  NOR2X1 U81 ( .A(_ST), .B(reset), .Y(n34) );
  OAI22XL U82 ( .A0(state[1]), .A1(state[0]), .B0(state[2]), .B1(n26), .Y(FR)
         );
  OAI21XL U83 ( .A0(state[2]), .A1(n29), .B0(n16), .Y(HR) );
endmodule

