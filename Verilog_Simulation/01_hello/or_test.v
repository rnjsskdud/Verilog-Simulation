module or_test(t1,t2,p);
output t1,t2;
input p;

reg t1,t2;  //값이 안바뀜

initial begin
    #100;   //100steps
    t1 <= 1'b0;
    t2 <= 1'b0;

    #100;   //100steps
    t1 <= 1'b0;
    t2 <= 1'b1;

    #100;   //100steps
    t1 <= 1'b1;
    t2 <= 1'b0;

    #100;   //100steps
    t1 <= 1'b1;
    t2 <= 1'b1;

    //100steps 지날때마다 값 바뀜
    $finish;
end

endmodule