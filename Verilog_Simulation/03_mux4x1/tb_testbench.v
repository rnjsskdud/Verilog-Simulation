`timescale 1ns/1ps

`define GATE_LEVEL
//`define DATAFLOW_LEVEL1

module tb_testbench; 

wire [3:0] data;
wire [1:0] sel;
wire       out;
mux4x1_test tester(.t1(data),.t2(sel), .p(out));
//                      |         |        ^   
//                      V         V        |
mux4x1        dut (.in(data), .sel(sel), .out(out));

always @( data, sel, out )
begin
    $display("%4b %2b %b",data,sel,out);
end

initial begin
    $dumpfile("tb_test_out.vcd");   //관찰한 결과 저장
    $dumpvars(0,dut);               //dut module 관찰
end

endmodule