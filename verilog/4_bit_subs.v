`timescale 1ns / 1ps


module four_bit_subs(
        input A3, A2, A1, A0,  
        input B3, B2, B1, B0,  
        input Bin,             
        input Enable,          
        output Diff3, Diff2, Diff1, Diff0, 
        output Bout
    );
    wire Bout0, Bout1, Bout2; 
    wire Diff0_int, Diff1_int, Diff2_int, Diff3_int;
    
    one_bit_subs sub0(
        .A(A0), .B(B0), .Bin(Bin),
        .Diff(Diff0_int), .Bout(Bout0)
    );

    one_bit_subs sub1(
        .A(A1), .B(B1), .Bin(Bout0),
        .Diff(Diff1_int), .Bout(Bout1)
    );

    one_bit_subs sub2(
        .A(A2), .B(B2), .Bin(Bout1),
        .Diff(Diff2_int), .Bout(Bout2)
    );

    one_bit_subs sub3(
        .A(A3), .B(B3), .Bin(Bout2),
        .Diff(Diff3_int), .Bout(Bout)
    );

   
    assign Diff0 = (Enable) ? Diff0_int : 1'b0;
    assign Diff1 = (Enable) ? Diff1_int : 1'b0;
    assign Diff2 = (Enable) ? Diff2_int : 1'b0;
    assign Diff3 = (Enable) ? Diff3_int : 1'b0;
endmodule
