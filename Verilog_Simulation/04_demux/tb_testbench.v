`timescale 1ns/1ps

`define DATAFLOW_LEVEL1

module tb_testbench; 

wire F,A,B,C,D;
wire [1:0] sel;

demux_test tester (.t1(F), .t2(sel), .p1(A), .p2(B), .p3(C), .p4(D));
//                    |       |         ^       ^      ^       ^
//                    V       V         |       |      |       |  
demux         dut   (.F(F), .sel(sel), .A(A), .B(B), .C(C), .D(D));

always @( F, sel, A,B,C,D )
begin
    #1;
    $display("%b %2b %b %b %b %b",F,sel,A,B,C,D);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule