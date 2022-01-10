`timescale 1ns/1ps
module tb_nand4;
   reg [3:0] a;
   wire y;
   integer i;

   nand4_if tb(a,y);

   //waveform을 보기위한 파일 생성
   initial
   begin
      $dumpfile("tb_nand4_out.vcd");
       $dumpvars(0,tb);  // tb는 nand4_if instance의 이름 
      $monitor("%b",y);
   end

   initial
   begin
      a=0;
      for(i=0; i<32; i = i+1)
      begin
         #20;
         a=i;
      end
      $finish;
   end
endmodule
