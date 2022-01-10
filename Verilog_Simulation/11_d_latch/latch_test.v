module latch_test(t1, t2, p);

input  p;
output t1, t2;    //CLK, d  generation

reg t1, t2;

//clock generation
initial begin
   forever #50 t1 = ~t1;   //period 100 half period 50
end

initial begin
   t1 = 1'b0;    // CLK initially zero

   t2 = 1'b0;    // D is zero
   
   #75;
   t2 = 1'b1;    // D is 1

   #85;
   t2 = 1'b0;    // D is 0

   #10;
   t2 = 1'b1;    // D is 1

   #35;
   t2 = 1'b0;    // D is 0

   #5;
   t2 = 1'b1;    // D is 1

   #100;
   $finish;
end

endmodule

// initial begin ~ end 각각 다 병렬적으로 실행. 0ps부터 모든 파일이 동시에 실행된다.