`define S0 2'b00
`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

`define G   2'b00
`define Y   2'b01
`define R   2'b10   

module LIGHT(   CLK, RESETB,
                TA, TB, 
                LA1, LA0,
                LB1, LB0
);

input CLK, RESETB, TA, TB;

output LA1;
output LA0;
wire   [1:0] LA;
assign LA1 = LA[1];
assign LA0 = LA[0];


output LB1;
output LB0;  // nbit data -> bus structure
wire   [1:0] LB;
assign LB1 = LB[1];
assign LB0 = LB[0];

//  state
reg     [1:0]   S;
reg     [1:0]   NEXT_S;     //  조건 유지

//  (1) next state generation
// assign NEXT_S[1] = S[1] ^ S[0];
// assign NEXT_S[0] = ( ~S[1] & ~S[0] & ~TA ) | ( S[1] & ~S[0] & ~TB );
always @ ( TA or TB or S )
        case ( S )
        `S0 :
            if( ~TA )
                NEXT_S  <= `S1;
            else
                NEXT_S  <= S;
        `S1 :
            NEXT_S  <= `S2;
        `S2 :
            if ( ~TB )
                NEXT_S  <= `S3;
            else  
                NEXT_S  <= S;
        `S3 :
            NEXT_S  <= `S0;
        
        endcase

//  (2) next state -> current state update, feedback 
always @( negedge RESETB or posedge CLK)
    if (~RESETB)             // when RESETB is 0, may be reset, synchronous system, asynchronous system.
        S <= 2'b00;
    else
        S <= NEXT_S;


//  (3) output stage, stable state start

/*
assign LA1 =  S[1];
assign LA0 = ~S[1] & S[0];
assign LB1 = ~S[1];
assign LB0 =  S[1] & S[0];
*/

assign LA = S == `S0 ? `G:
            S == `S1 ? `Y:
            S == `S2 ? `R:
            S == `S3 ? `R: `G;

assign LB = S == `S0 ? `R:
            S == `S1 ? `R:
            S == `S2 ? `G:
            S == `S3 ? `Y: `R;

endmodule