// ---------------------------------------------------------------------
// |                          This is SME                              |
// |   Date:23/05/22                                                   |
// |   version:0.1                                                     |
// |   abstract:The first try to design String Matching Engine using   |
// |            two FSM                                                |
// | ----------------------------------------------------------------- |
// |   modification history:                                           | 
// |                                                                   |
// ---------------------------------------------------------------------
`timescale 1ns/10ps
module SME (clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring,ispattern;
output reg match;
output reg [4:0] match_index;
output reg valid;

reg [2:0] cs1,cs2,ns1,ns2;
reg finish;
reg [5:0] cnt_s; //string counter
reg [4:0] cnt_p; //pattern counter,help me check if [2:0] is right          // this is right
reg [4:0] cnt_m,cnt_m_temp; //match counter,help me check if [2:0] is right // this is right because pattern(max)= 8
reg [5:0] index_s;
reg [4:0] index_p,index_p_temp; //help me check if [2:0] is right           // this is right
reg [7:0] pat_reg [0:7]; //pattern reg
reg [7:0] str_reg [0:31]; //string reg
reg pat_is_star;


//FSM_1 states
parameter S0 = 3'd0;
parameter S1 = 3'd1;
parameter S2 = 3'd2;
parameter S3 = 3'd3;
parameter S4 = 3'd4;

//FSM_2 states
parameter _S0 = 3'd0;
parameter _S1 = 3'd1;
parameter _S2 = 3'd2;
parameter _S3 = 3'd3;
parameter _S4 = 3'd4;

//state switching
always @ (posedge clk or posedge reset)
begin
  if (reset)
  begin 
    cs1 <= S0; //FSM_1
    cs2 <= _S0;//FSM_2
  end
  else
  begin
    cs1 <= ns1; //FSM_1
    cs2 <= ns2; //FSM_2
  end
end
////////////////////////// 0608 edit
wire in_string, in_pattern;
assign in_string = isstring ^ 1'd0 ;
assign in_pattern = ispattern ^ 1'd0;
//////////////////////////
//FSM_1
always @ (*)
begin 
  case (cs1)
  S0 : begin 
         if (in_string)
           ns1 = S1;
         else if (in_pattern) //first input pattern but no string?
           ns1 = S2;
         else 
           ns1 = S0;
       end
  S1 : begin //input string
         if (in_string)
           ns1 = S1;
         else 
           ns1 = S2;
       end
  S2 : begin //input pattern
         if (in_pattern)
           ns1 = S2;
         else 
           ns1 = S3;
         end
  S3 : begin //compute the result
         if (finish ^ 1'd0)
           ns1 = S4;
         else 
           ns1 = S3;
       end
  S4 : begin
//       if (isstring == 1'd1)
//         ns1 = S1;
//       else if (ispattern == 1'd1)
//         ns1 = S2;
//       else 
           ns1 = S0;
       end
  default : ns1 = S0;
  endcase
end
 //FSM_2
always @ (*) 
begin
  if (cs1 == S3) //computing result when FSM_1 = S3  
  begin
    case (cs2)
    _S0 : begin
            ns2 = _S1;
          end
    _S1 : begin
            if (cnt_m == cnt_p) //when #match = #pattern, match successfully
              ns2 = _S3;
            else if (cnt_s == index_s || cnt_p == index_p)
              ns2 = _S2;
            else 
              ns2 = _S1;
          end
    _S2 : begin
            if (pat_reg[cnt_p-5'd1] == 8'h24) //*help me check if this is right* 
		    begin
              if (cnt_m + 5'd1 == cnt_p)
                ns2 = _S3;
              else 
                ns2 = _S4;
            end
            else 
          begin
            if (cnt_m == cnt_p)
              ns2 = _S3;
            else 
            ns2 = _S4;
          end
          end
    _S3 : ns2 = _S0; // success ******//_S3, _S4 combine
    _S4 : ns2 = _S0; // fail
    default : ns2 = _S0;  
    endcase
  end
  else 
    ns2 = _S0;
end

//compute logic
always @ (posedge clk or posedge reset)
begin 
  if(reset)
    begin
      index_s <= 6'd0;
      index_p <= 5'd0;
      index_p_temp <= 5'd0;
      cnt_m <= 5'd0;
      cnt_m_temp <= 5'd0;
      //match_index <= 5'd0;
      finish <= 1'd0;
      pat_is_star <= 1'd0;
    end
  else if(cs1 == S0) 
    begin
      index_s <= 6'd0;
      index_p <= 5'd0;
      index_p_temp <= 5'd0;
      cnt_m <= 5'd0;
      cnt_m_temp <= 5'd0;
      //match_index <= 5'd0;
      finish <= 1'd0;
      pat_is_star <= 1'd0;
    end
  else if(cs1 == S3)
  begin
   if(cs2 == _S1) // can use case statement to reduce area?
   begin 
     if (str_reg[index_s] == pat_reg[index_p] || pat_reg[index_p] == 8'h2e)
     begin
       index_p <= index_p + 5'd1;
       index_s <= index_s + 6'd1;
       cnt_m <= cnt_m + 5'd1;
       if(index_p == 5'd0) 
	     match_index <= index_s; //latch 
     end
     else if (pat_reg[index_p] == 8'h5e) // ^
       begin
       if (index_s == 6'd0 && (str_reg[index_s] == pat_reg[index_p+5'd1] || pat_reg[index_p+5'd1] == 8'h2e)) 
       begin
         index_p <= index_p + 5'd1;
         index_s <= index_s + 6'd1;
         cnt_m <= cnt_m + 5'd1;
       if(str_reg[index_s] == 8'h20)
 	     match_index <= index_s + 6'd1; // can be delete
       else 
	     match_index <= index_s;
       end
     else if(str_reg[index_s] == 8'h20 && (str_reg[index_s+5'd1] == pat_reg[index_p+5'd1] || pat_reg[index_p+5'd1] == 8'h2e))
     begin
       index_p <= index_p + 5'd1;
       index_s <= index_s + 6'd1;
       cnt_m <= cnt_m + 5'd1;
       if(str_reg[index_s] == 8'h20) 
         match_index <= index_s + 6'd1; // match_index <= index + 5'd1;
       else 
	     match_index <= index_s; // delete
     end
     else
     begin //**
       index_p <= index_p_temp; //index_p_temp? 0? for the use of *??
       cnt_m <= 5'd0;
     if (index_p != 5'd0) 
	   index_s <= match_index + 6'd1; 
     else 
	   index_s <= index_s + 6'd1;
     end
   end
   
   
    else if (pat_reg[index_p] == 8'h24 && (index_s == cnt_s || str_reg[index_s] == 8'h20)) // $ 
      begin
        index_p <= index_p + 5'd1;
        index_s <= index_s + 6'd1;
        cnt_m <= cnt_m + 5'd1;
      if (index_p == 5'd0) 
	    match_index <= index_s; //latch
      end
   
   
    else if (pat_reg[index_p] == 8'h2A) // *
      begin 
        pat_is_star <= 1'd1;
        index_p <= index_p + 5'd1;
        index_p_temp <= index_p + 5'd1; //maybe will have problem 
        cnt_m <= cnt_m + 5'd1;
        cnt_m_temp <= cnt_m + 5'd1;
        if(index_p == 5'd0) 
		  match_index <= index_s; //latch 
     end
   
   
    else if (pat_is_star == 1'd1 && str_reg[index_s] != pat_reg[index_p] && pat_reg[index_p] != 8'h2e) // when * and no match
      begin
        index_p <= index_p_temp;
        cnt_m <= cnt_m_temp;
        index_s <= index_s + 6'd1;
      end
    else if (str_reg[index_s] != pat_reg[index_p] && pat_reg[index_p] != 8'h2e) 
      begin
        index_p <= index_p_temp;
        cnt_m <= 5'd0;
        if(index_p != 5'd0) index_s <= match_index + 6'd1;
        else index_s <= index_s + 6'd1;
      end
  end
  else if (cs2 == _S3 || cs2 == _S4) 
  begin
    finish <= 1'd1;
  end
  end
  else finish <= 1'd0;
end
 
//match
always @ (posedge clk or posedge reset)
begin
  if (reset) 
    match <= 1'd0;
  else if (cs2 == _S3) 
    match <= 1'd1;
  else if (cs2 == _S4) 
    match <= 1'd0;
  //else 
    //match <= 1'd0;
end

//valid
always @ (posedge clk or posedge reset)
begin
  if (reset)
    valid <= 1'd0;
  else if (cs1 == S4) //*help me check
    valid <= 1'd1;
  else 
    valid <= 1'd0;
end


//str_reg
integer  i;
always@(posedge clk or posedge reset) 
begin
    if(reset) 
    begin
      for(i=0;i<32;i=i+1) //or assign repeatly?
    begin
      str_reg[i] <= 8'd0;
    end
    end
    else if(cs1 == S4 && ns1 == S1) 
      str_reg[5'd0] <= chardata;
    else if(in_string) 
      str_reg[cnt_s] <= chardata;
end

//string counter
reg [5:0] cnt_s_reg;

always@(*) 
begin
    if(cs1 == S4 && ns1 == S1) 
      cnt_s = 6'd0;
    else if(cs1  == S0 && ns1 == S1)
      cnt_s = 6'd0;
    else if(in_string) 
      cnt_s = cnt_s_reg + 6'd1;
    else 
      cnt_s = cnt_s_reg;
end

always@(posedge clk or posedge reset) 
begin
    if(reset) 
      cnt_s_reg <= 6'd0;
   // else if(cs1 == S4 && ns1 == S1) cnt_s_reg <= 6'd0;
    else if(in_string)
      cnt_s_reg <= cnt_s;
end

//pat_reg
always@(posedge clk or posedge reset) 
begin
    if(reset)
    begin
      for(i=0;i<8;i=i+1) 
	begin
        pat_reg[i] <= 8'd0;
    end       
    end
    else if(in_pattern)
      pat_reg[cnt_p] <= chardata;
end

//pattern counter
always@(posedge clk or posedge reset) 
begin
    if(reset) 
      cnt_p <= 5'd0;
    else if(in_pattern)
      cnt_p <= cnt_p + 5'd1;
    else if(ns1 == S4) 
      cnt_p <= 5'd0;
end

endmodule