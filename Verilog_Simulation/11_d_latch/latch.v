module latch(CLK, D, Q, Qb);
input   CLK, D;     //input is wire type
output  Q, Qb;

reg Q;          //output is reg or wire type. 
assign Qb = ~Q;

//always CLK and D change, sensitivity list
always @ ( CLK or D ) 
    if  ( CLK )
        Q <= D; 
    //  else
    //  Q <= Q;     //  preserve

endmodule