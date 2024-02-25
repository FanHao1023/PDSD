`include "./half_adder.v"
module full_adder (x,y,z,s,c);
input x,y,z;
output s,c;

half_adder ha1(x,y,s0,c0);
half_adder ha2(s0,z,s,c1);
or(c,c0,c1);

endmodule