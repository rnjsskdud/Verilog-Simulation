`timescale 1ns/1ps

module tb_testbench; 

wire r, s, q;   // r,s : input  Q : output

sr_test tester (.t1(r), .t2(s), .p(q) );
//                 |        |       ^
//                 V        V       |
sr          dut(.R(r), .S(s), .Q(q), .Qb( ));   //  Qb is floating

always @(r or s or q)
begin
    #1;
    $display("%b %b %b", r, s, q);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule