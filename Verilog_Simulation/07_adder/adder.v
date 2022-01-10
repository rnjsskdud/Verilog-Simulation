module adder (A, B, Cin, S, Cout);

input   A, B, Cin;
output  S, Cout;

`ifdef DATAFLOW_LEVEL1
assign      S    =  A ^ B ^ Cin;
assign      Cout =  (A & B) | (A & Cin) | (B & Cin);

`elsif GATE_LEVEL 
wire w0, w1, w2;
xor x0(S, A, B, Cin);


and a0(w0, A, B);
and a1(w1, B, Cin);
and a2(w2, A, Cin);

or  o0(Cout, w0, w1, w2);

`elsif DATAFLOW_LEVEL3

end
`endif

endmodule