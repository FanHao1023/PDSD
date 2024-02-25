`include "./CLadder_4.v"
module adder (X,Y,op_mode,SUM,C_out,Overflow);
input[7:0] X,Y;
input op_mode;
output[7:0] SUM;
output C_out,Overflow;
wire c0,ov0;
wire[7:0] _Y;

xor #2 (_Y[0],Y[0],op_mode);
xor #2 (_Y[1],Y[1],op_mode);
xor #2 (_Y[2],Y[2],op_mode);
xor #2 (_Y[3],Y[3],op_mode);
xor #2 (_Y[4],Y[4],op_mode);
xor #2 (_Y[5],Y[5],op_mode);
xor #2 (_Y[6],Y[6],op_mode);
xor #2 (_Y[7],Y[7],op_mode);
CLadder_4 add0(X[3:0],_Y[3:0],op_mode,SUM[3:0],c0,ov0);
CLadder_4 add1(X[7:4],_Y[7:4],c0,SUM[7:4],C_out,Overflow);

endmodule