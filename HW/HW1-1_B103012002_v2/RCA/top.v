`include "./full_adder.v"
module adder(X,Y,op_mode,SUM,C_out,Overflow);
input[7:0]X,Y;
input op_mode;
output[7:0]SUM;
output C_out,Overflow;
wire c0,c1,c2,c3,c4,c5,c6;

xor(_Y0,op_mode,Y[0]);
xor(_Y1,op_mode,Y[1]);
xor(_Y2,op_mode,Y[2]);
xor(_Y3,op_mode,Y[3]);
xor(_Y4,op_mode,Y[4]);
xor(_Y5,op_mode,Y[5]);
xor(_Y6,op_mode,Y[6]);
xor(_Y7,op_mode,Y[7]);
full_adder fa0(X[0],_Y0,op_mode,SUM[0],c0);
full_adder fa1(X[1],_Y1,c0,SUM[1],c1);
full_adder fa2(X[2],_Y2,c1,SUM[2],c2);
full_adder fa3(X[3],_Y3,c2,SUM[3],c3);
full_adder fa4(X[4],_Y4,c3,SUM[4],c4);
full_adder fa5(X[5],_Y5,c4,SUM[5],c5);
full_adder fa6(X[6],_Y6,c5,SUM[6],c6);
full_adder fa7(X[7],_Y7,c6,SUM[7],C_out);
xor #2 (Overflow,c6,C_out);

endmodule