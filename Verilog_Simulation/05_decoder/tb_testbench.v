`timescale 1ns/1ps

//`define DATAFLOW_LEVEL1
`define DATAFLOW_LEVEL2

module tb_testbench; 

wire [1:0] A;   //output in this tester
wire [3:0] Y;   //input in this tester

decoder_test tester (.t1(A), .t2(Y));
//                     |       ^        
//                     V       |         
decoder          dut(.A(A), .Y(Y));

always @(A or Y)
begin
    #1;
    $display("%2b %4b",A,Y);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule