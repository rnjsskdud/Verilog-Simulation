`timescale 1ns/1ps

module tb_testbench; 

wire clk, d,  Q;   // d : input  Q : output

latch_test tester (.t1(clk), .t2(d), .p(Q) );
//                    |        |       ^
//                    V        V       |
latch         dut (.CLK(clk), .D(d), .Q(Q), .Qb( ));   //  Qb is floating

//  always는 관찰대상, 변화를 감지할 수 있음

always @(clk or d or Q)
begin
    #1;
    $display("%b %b %b", clk, d, Q);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule

