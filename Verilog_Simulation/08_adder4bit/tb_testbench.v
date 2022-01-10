`timescale 1ns/1ps

//`define GATE_LEVEL
`define DATAFLOW_LEVEL1
//`define DATAFLOW_LEVEL2
//`define DATAFLOW_LEVEL3

module tb_testbench; 

wire [3:0] A, B, S;
wire CIN, COUT;

adder4bit_test tester (.t1(A), .t2(B), .t3(CIN), .p1(S), .p2(COUT));
//                     |       |       |          ^          ^
//                     V       V       V          |          |
adder4bit     dut    (.A(A), .B(B), .Cin(CIN), .S(S), .Cout(COUT));

always @(A or B or CIN or S or COUT)
begin
    #1;
    $display("%4b %4b %4b %b %b", A, B, CIN, S, COUT);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule