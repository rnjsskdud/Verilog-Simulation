`timescale 1ns/1ps

`define GATE_LEVEL
//`define DATAFLOW_LEVEL

module tb_testbench; 

wire n1,n2,n3,n4;
//              a  b  sel out
mux_test tester(n1,n2,n3,n4);
//              |  |  |   ^
//              V  V  V   |
my_mux dut     (n1,n2,n3,n4);

always @( n1, n2, n3, n4 )
begin
    #1;
    $display("%b %b %b %b",n1,n2,n3,n4);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule