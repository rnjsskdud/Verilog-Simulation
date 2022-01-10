module alu1bit (A,B,CIN,F1,F0,COUT,RES);

    input   A,B,CIN,F1,F0;      //CIN == F0
    output  COUT,RES;

    //  ALUCTRL 2x4 decoder
    wire F1n, F0n;              //  not wire
    wire y0, y1, y2, y3;        //  select pin 
    not  (F1n, F1);
    not  (F0n, F0);

    and and2_0 (y0, F1n, F0n);
    and and2_1 (y1, F1n,  F0);
    and and2_2 (y2, F1 , F0n);
    and and2_3 (y3, F1 , F0 );

    //  ALU logic : full adder B select
    wire x0, x1, x2, x3;        // operation result
    wire B0, B1, BB;      //  B select
    and and2_4 (B0, B, CIN);
    and and2_5 (B1, B, CIN);
    or  or2_0 (BB, B0, B1);

    //  ALU logic : full adder
    wire w0, w1, w2;
    xor xor2_0(x0, A, BB, CIN);     // add / sub result 
    xor xor2_1(x1, A, BB, CIN);     // add / sub result   

    // Cout result                
    and and2_6(w0, A, BB);          
    and and2_7(w1, BB, CIN);
    and and2_8(w2, A, CIN);
    or  or2_1(COUT, w0, w1, w2);

    //  ALU logic : and
    and and2_9(x2, A, B);

    //  ALU logic : or
    or  or2_2(x3, A, B);

    //  ALU RES : 4x1 mux use
    wire z0,z1,z2,z3;
    and and2_10(z0, x0, y0);    //add
    and and2_11(z1, x1, y1);    //sub
    and and2_12(z2, x2, y2);    //and
    and and2_13(z3, x3, y3);    //or

    //  ALU RES!!!
    or or4_0(RES,z0,z1,z2,z3);

endmodule