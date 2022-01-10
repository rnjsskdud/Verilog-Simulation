`timescale 1ns/1ps

module tb_testbench; 


wire    a, b, cin, f1, f0;
wire    cout, res; 

alu1bit_test tester (.t1(a), .t2(b), .t3(cin), .t4(f1), .t5(f0), .p1(cout), .p2(res));
//                      |              |         |         |       ^           ^         
//                      V              V         V         V       |           |       
alu1bit         dut (.A(a), .B(b), .CIN(cin), .F1(f1), .F0(f0), .COUT(cout), .RES(res));  

//  always는 관찰대상, 변화를 감지할 수 있음

always @(a or b or cin or f1 or f0 or cout or res )

begin
    #1;
    $display("%b %b %b %b%b %b %b", a, b, cin, f1, f0, res, cout);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars;               //dut module 관찰
end

endmodule

