module alu1bit_test(t1, t2, t3, t4, t5, p1, p2);
//     COUT RES  
input  p1,  p2;

//       A   B   CIN  F1  F0
output   t1, t2,  t3, t4, t5;   

reg t1, t2, t3, t4, t5;

// F1  F0
// 0   0    add
// 0   1    sub
// 1   0    and
// 1   1    or



initial begin
   t1 <= 1'b0;    // A
   t2 <= 1'b1;    // B
   t3 <= 1'b1;    // CIN
   t4 <= 1'b0;    // F1
   t5 <= 1'b0;    // F0

   #100;
   t1 <= 1'b0;    // A
   t2 <= 1'b1;    // B
   t3 <= 1'b1;    // CIN
   t4 <= 1'b0;    // F1
   t5 <= 1'b1;    // F0

   #100;
   t1 <= 1'b0;    // A
   t2 <= 1'b1;    // B
   t3 <= 1'b1;    // CIN
   t4 <= 1'b1;    // F1
   t5 <= 1'b0;    // F0

   #100;
   t1 <= 1'b0;    // A
   t2 <= 1'b1;    // B
   t3 <= 1'b1;    // CIN
   t4 <= 1'b1;    // F1
   t5 <= 1'b1;    // F0
  
   #100;
   $finish;
end

endmodule

// 각각 다 병렬적으로 실행. 모든 파일이 동시에 실행된다.