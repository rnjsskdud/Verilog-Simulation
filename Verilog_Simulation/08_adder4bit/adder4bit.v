module adder4bit (A, B, Cin, S, Cout);

input   [3:0] A, B;
input            Cin;
output  [3:0]    S;
output           Cout;

`ifdef DATAFLOW_LEVEL1

wire c0, c1, c2;
adder      add0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(c0) );
adder      add1(.A(A[1]), .B(B[1]), .Cin(c0), .S(S[1]),  .Cout(c1) );
adder      add2(.A(A[2]), .B(B[2]), .Cin(c1), .S(S[2]),  .Cout(c2) );
adder      add3(.A(A[3]), .B(B[3]), .Cin(c2), .S(S[3]),  .Cout(Cout) );


`elsif GATE_LEVEL 
xor x0(S, A, B, Cin);

wire w0, w1, w2;

and a0(w0, A, B);
and a1(w1, B, Cin);
and a2(w2, A, Cin);

or  o0(Cout, w0, w1, w2);

`elsif DATAFLOW_LEVEL3

end
`endif

endmodule