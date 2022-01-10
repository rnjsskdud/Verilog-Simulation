`timescale 1ns/1ps
module tb_testbench; 

wire n1,n2,n3;
or_test tester(n1,n2,n3);
//              | |  ^  
//              V V  |
or_gate dut   (n1,n2,n3);

always @( n1, n2, n3 )
begin
    $display("%b %b %b",n1,n2,n3);
end

initial begin
    $dumpfile("tb_test_out.vcd"); //관찰한 결과 저장
    $dumpvars(0,dut);              //dut module 관찰
end

endmodule