//         ㅡㅡㅡㅡ
//  a -->  | MUX  |-->out
//  b -->  |      |
//         ㅡㅡㅡㅡ
//             |
//        sel--+  

module my_mux (a,b,sel,out);

input a,b,sel;
output out;

`ifdef GATE_LEVEL
wire selb, out1, out2;
not i1(selb,sel);

and a1(out1, a, selb);
and a2(out2, b, sel);
or  o1(out, out1, out2);

`elsif   DATAFLOW_LEVEL      //  RTL level implementation
assign out = sel ? b : a ;

`endif

endmodule