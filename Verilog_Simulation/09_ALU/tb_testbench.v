`timescale 1ns/1ps

//`define GATE_LEVEL
`define DATAFLOW_LEVEL1
//`define DATAFLOW_LEVEL2
//`define DATAFLOW_LEVEL3

module tb_testbench; 

wire A, B, RES;
wire [1:0] ALUCTRL; 

ALU_test tester (.t1(A), .t2(B), .t3(ALUCTRL), .p1(RES));
ALU         dut (.A(A), .B(B), .ALUCtrl(ALUCTRL), .Res(RES));

always @(A or B or RES or ALUCTRL)
begin
    #1;
    $display("%b %b %2b %b", A, B, ALUCTRL, RES);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule