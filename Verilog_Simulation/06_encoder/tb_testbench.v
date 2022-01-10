`timescale 1ns/1ps

//`define DATAFLOW_LEVEL1
//`define DATAFLOW_LEVEL2
`define DATAFLOW_LEVEL3

module tb_testbench; 

wire [7:0]  A;  //input
wire [2:0]  Y;  //output

encoder_test tester (.t1(A), .t2(Y));
//                     |       ^        
//                     V       |         
encoder         dut (.A(A), .Y(Y));

always @(A or Y)
begin
    #1;
    $display("%8b %3b",A,Y);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule