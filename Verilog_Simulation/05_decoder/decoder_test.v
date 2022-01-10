module decoder_test(t1, t2);
output [1:0]   t1;
input  [3:0]   t2;

//output port reg type simulation
reg       t1;

initial begin
   t1 <= 2'b00;
   
   #100;
   t1 <= 2'b01;

   #100;
   t1 <= 2'b10;

   #100;
   t1 <= 2'b11;

   #100;
   $finish;
end

endmodule