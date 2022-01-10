module LIGHT(   CLK, RESETB,
                TA, TB, 
                LA1, LA0,
                LB1, LB0
);

input CLK, RESETB, TA, TB;
output LA1, LA0, LB1, LB0;  // nbit data -> bus structure

wire [1:0] LA = {LA1, LA0};
wire [1:0] LB = {LB1, LB0};

//  state
reg     [1:0]   S;
wire    [1:0]   NEXT_S;

//  (1) next state generation
assign NEXT_S[1] = S[1] ^ S[0];
assign NEXT_S[0] = ( ~S[1] & ~S[0] & ~TA ) | ( S[1] & ~S[0] & ~TB );

//  (2) next state -> current state update, feedback 
always @( negedge RESETB or posedge CLK)
    if (~RESETB)             // when RESETB is 0, may be reset, synchronous system, asynchronous system.
        S <= 2'b00;
    else
        S <= NEXT_S;

//  (3) output stage, stable state start
assign LA1 =  S[1];
assign LA0 = ~S[1] & S[0];
assign LB1 = ~S[1];
assign LB0 =  S[1] & S[0];

endmodule