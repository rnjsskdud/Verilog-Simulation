module mux_test(t1, t2, t3, p);
output t1, t2, t3;
input p;

reg t1,t2,t3;  //값이 안바뀜

initial begin
    //  a,b forcing
    t1 <= 1;
    t2 <= 0;
    t3 <= 0;

    #100;
    t3 <= 0;    //select a

    #100;   
    t3 <= 1;    //select b

    #100;  
    t3 <= 0;    //select a
    
    #100;   
    t3 <= 1;    //select b

    $finish;
end

endmodule