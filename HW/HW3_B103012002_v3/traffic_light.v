module traffic_light (HG,HY,HR,HL,FG,FR,FY,FL,_ST,clk,reset,sel);
input clk,reset,sel;
output HG,HY,HR,HL,FG,FR,FY,FL,_ST;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101;
reg[2:0] state,n_state;
reg[3:0] count;
reg _ST,ST;
wire TL,TM,TS,clr;

assign HG = (state==S0);
assign HL = (state==S1);
assign HY = (state==S2);
assign HR = (state==S1) | (state==S3) |(state==S4) | (state==S5);
assign FG = (state==S3);
assign FL = (state==S4);
assign FY = (state==S5);
assign FR = (state==S0) | (state==S1) | (state==S2) | (state==S4);
assign TL = (count==4'b1010);
assign TM = (count==4'b0101);
assign TS = (count==4'b0010);
assign clr = reset | _ST;

//counter
always @ (posedge clk or posedge clr)
  if (clr)
   count <= 4'b0000;
  else 
   count <= count+1;
  
always @ (posedge clk or posedge reset)
  if (reset)
    begin
	  state<=S0;
	  _ST<=1'b0;
	end
  else 
   begin
    state<=n_state;
	_ST<=ST;
   end
   
//FSM
always @ (*)
  case(state)
    S0:if(TL)
	    begin
	     n_state<=S1;
		 ST<=1'b1;
		end 
	   else
	    begin
	     n_state<=S0;
		 ST<=1'b0;
		end
    S1:if(TM)
	    begin
	     n_state<=S2;
		 ST<=1'b1;
		 end
	   else
	     begin
	     n_state<=S1;
		 ST<=1'b0;
		 end
	S2:if(TS&sel)
	    begin
	     n_state<=S3;
		 ST<=1'b1;
		end
	   else if (TS&~sel)
		begin
	     n_state<=S0;
		 ST<=1'b0;
		end
	   else
	    begin
	     n_state<=S2;
		 ST<=1'b0;
		end
    S3:if(TL)
	    begin
	     n_state<=S4;
		 ST<=1'b1;
		 end
	   else 
	    begin
	     n_state<=S3;
		 ST<=1'b0;
		 end
	S4:if(TM)
	    begin
	     n_state<=S5;
		 ST<=1'b1;
		end
	   else 
	    begin
	     n_state<=S4;
		 ST<=1'b0;
		end
	S5:if(TS)
	    begin
	     n_state<=S0;
		 ST<=1'b1;
		 end
	   else 
	    begin
	     n_state<=S5;
		 ST<=1'b0;
        end
	default:
	  begin
	   n_state<=S0;
	   ST<=1'b0;
	  end
	endcase
endmodule