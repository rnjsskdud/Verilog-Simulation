module ff(CLK, D, Q, Qb);
input   CLK, D;     //input is wire type
output  Q, Qb;

reg Q;          //output is reg or wire type. 
assign Qb = ~Q;

//CLK is rising edge, level triggerd : latch (simulation error, design error)
always @ ( posedge CLK  /*or D  unwanted latch*/ )  
        Q <= D;     // Sampling D at CLK edge
    //  else
    //  Q <= Q;     //  preserve

endmodule