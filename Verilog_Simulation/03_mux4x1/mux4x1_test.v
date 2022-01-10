module mux4x1_test(t1, t2,, p);
output [3:0]t1;
output [1:0]t2;
input p;

reg [3:0] t1;
reg [1:0] t2;

initial begin
   t1 <= 4'b0101;
   t2 <= 2'b00;   //selec in[0]

   #100;
   t2 <= 2'b01;    //selec in[1]

    #100;
   t2 <= 2'b10;     //selec in[2]

    #100;
   t2 <= 2'b11;     //selec in[3]

    #100;
    $finish;
end

endmodule