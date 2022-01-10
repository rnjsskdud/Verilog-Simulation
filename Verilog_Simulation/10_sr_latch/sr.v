module sr(R, S, Q, Qb);

input R, S;     //input is wire type
output Q, Qb;

reg Q;          //output is reg or wire type. 
assign Qb = ~Q;

always @ ( posedge R  or posedge S ) 
    if  ( R  )
        Q <= 1'b0; 
    else if ( S  )
        Q <= 1'b1;
    //  else
    //  Q <= Q;     //  preserve

endmodule