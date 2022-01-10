module LIGHT_test(t1, t2, t3, t4, p1, p2, p3, p4);
//     LA1  LA0  LB1 LB0   
input  p1,  p2,  p3, p4;

//     CLK RESET  TA  TB   
output   t1, t2,  t3, t4;   

reg t1, t2, t3, t4;

//clock generation
initial begin
   forever #50 t1 = ~t1;   //period 100 half period 50
end


initial begin
   t1 <= 1'b1;    // CLK 
   t2 <= 1'b1;    // RESETB

   t3 <= 1'b1;    // TA, 가로방향 ON (default)
   t4 <= 1'b0;    // TB

   #20;
   t2 <= 1'b0;    // triggering reset (active low)

   #100;
   t2 <= 1'b1;    // reset release, reset은 F/F만 초기화시킴

   #95;
   t4 <= 1'b1;    // TB
   
   #100;
   t3 <= 1'b0;    // TA is 0

   #300;
   t3 <= 1'b1;    // TA is 1 again, but TB is on
   t4 <= 1'b0;    // when TB is 0, horizontal load is active
   
   #300;
   t3 <= 1'b0;    // TA is deactive

   #100;
   $finish;
end

endmodule

// 각각 다 병렬적으로 실행. 모든 파일이 동시에 실행된다.