`timescale 1ns/1ps

module tb_testbench; 

wire clk, resetb;
wire ta, tb, la1, la0, lb1, lb0;   

LIGHT_test tester (.t1(clk), .t2(resetb), .t3(ta), .t4(tb), .p1(la1), .p2(la0), .p3(lb1), .p4(lb0));
//                   |              |         |         |       ^           ^         ^           ^   
//                   V              V         V         V       |           |         |           |  
LIGHT      dut (.CLK(clk), .RESETB(resetb), .TA(ta), .TB(tb), .LA1(la1), .LA0(la0), .LB1(lb1), .LB0(lb0));  

//  always는 관찰대상, 변화를 감지할 수 있음

always @(clk or resetb or ta or tb or la1 or la0 or lb1 or lb0 )

begin
    #1;
    $display("%b %b %b %b %b%b %b%b", clk, resetb, ta, tb, la1, la0, lb1, lb0);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule

