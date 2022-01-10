module sr_test(t1, t2, p);

input  p;
output t1, t2;    //r, s  generation

reg t1, t2;

initial begin
   t1 <= 1'b0;
   t2 <= 1'b0;    //R=0, S=0;

   #100;
   t1 <= 1'b0;
   t2 <= 1'b1;    //R=0, S=1  // Q = 1

   #100;
   t1 <= 1'b1;
   t2 <= 1'b0;    //R=1, S=0  // Q = 0

   #100;
   t1 <= 1'b0;
   t2 <= 1'b0;    // R=0, S=0  // Q is retention;

   #100;
   t1 <= 1'b0;
   t2 <= 1'b1;    // R=0, S=1   // Q = 1

   #100;
   t1 <= 1'b0;
   t2 <= 1'b0;    // R=0, S=0   // Q is retention;

   #100;
   $finish;
end

endmodule