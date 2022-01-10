module ALU  (A, B, ALUCtrl, Res);

input            A, B;
input   [1:0] ALUCtrl;
output            Res;

`ifdef DATAFLOW_LEVEL1

wire    invB;
assign  invB    = ALUCtrl[0] ? ~B : B;

wire    SUM;
adder add0(.A(A), .B(invB), .Cin(ALUCtrl[0]), .S(SUM), .Cout() );

wire    RES_AND, RES_OR;
assign  RES_AND = A & B;
assign  RES_OR  = A | B;

assign  Res = (ALUCtrl == 2'b00) ? SUM :
              (ALUCtrl == 2'b01) ? SUM :
              (ALUCtrl == 2'b10) ? RES_AND :
              (ALUCtrl == 2'b11) ? RES_OR : 1'b0;

`elsif GATE_LEVEL 

`elsif DATAFLOW_LEVEL3

end
`endif

endmodule