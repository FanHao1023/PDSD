module CLadder_4 (a,b,cin,sum,cout,ov);
input[3:0] a,b;
input cin;
output[3:0] sum;
output cout,ov;

xor #2 (p0,a[0],b[0]);
xor #2 (p1,a[1],b[1]);
xor #2 (p2,a[2],b[2]);
xor #2 (p3,a[3],b[3]);
and #2 (g0,a[0],b[0]);
and #2 (g1,a[1],b[1]);
and #2 (g2,a[2],b[2]);
and #2 (g3,a[3],b[3]);
and #2 (d0,p0,cin);
or #2 (c0,g0,d0);
and #2 (d10,p1,p0,cin);
and #2 (d11,p1,g0);
or #2 (c1,g1,d10,d11);
and #2 (d20,p2,p1,p0,cin);
and #2 (d21,p2,p1,g0);
and #2 (d22,p2,g1);
or #2 (c2,g2,d20,d21,d22);
and #2 (d30,p3,p2,p1,p0,cin);
and #2 (d31,p3,p2,p1,g0);
and #2 (d32,p3,p2,g1);
and #2 (d33,p3,g2);
or #2 (cout,g3,d30,d31,d32,d33);
xor #2 (sum[0],p0,cin);
xor #2 (sum[1],p1,c0);
xor #2 (sum[2],p2,c1);
xor #2 (sum[3],p3,c2);
xor #2 (ov,c2,cout);

endmodule