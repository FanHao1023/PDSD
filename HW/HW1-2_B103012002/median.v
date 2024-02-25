//===============================================================================//
//            PLEASE DO NOT modify basic I/O name or top module name!            // 
//===============================================================================//

module median (a0, a1, a2, out);

input    [7:0]   a0, a1, a2;
output reg  [7:0]   out;
wire [2:0] flag;
wire same,error,e0,e1,e2;

//====================================================================
//======================= enter your code here =======================
assign flag[0]=a1>a0;
assign flag[1]=a2>a0;
assign flag[2]=a2>a1;
assign same=(a0==a1)|(a1==a2)|(a0==a2);
assign e0=(a0==8'd1|a0==8'd2|a0==8'd4|a0==8'd8|a0==8'd16|a0==8'd32|a0==8'd64|a0==8'd128)?0:1;
assign e1=(a1==8'd1|a1==8'd2|a1==8'd4|a1==8'd8|a1==8'd16|a1==8'd32|a1==8'd64|a1==8'd128)?0:1;
assign e2=(a2==8'd1|a2==8'd2|a2==8'd4|a2==8'd8|a2==8'd16|a2==8'd32|a2==8'd64|a2==8'd128)?0:1;
assign error=e0|e1|e2;

always@(*)
 if(error==1'b1 | same==1'b1)
   out=8'b00000000;
 else
  case(flag)
   3'b000:out=a1;
   3'b001:out=a0;
   3'b011:out=a2;
   3'b100:out=a2;
   3'b110:out=a0;
   3'b111:out=a1;
   default:out=8'b00000000;
  endcase
//====================================================================

endmodule


