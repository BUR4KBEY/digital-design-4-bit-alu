`timescale 1ns / 1ps



module four_bit_adder_without_enable(
        input A3, A2, A1, A0,       
        input B3, B2, B1, B0,      
        input Cin,                                   
        output Sum3, Sum2, Sum1, Sum0,  
        output Cout 
    );
     wire C1, C2, C3;
    
    one_bit_adder U0 (
        .A(A0),
        .B(B0),
        .Cin(Cin),
        .Sum(Sum0),
        .Cout(C1)
    );

    one_bit_adder U1 (
        .A(A1),
        .B(B1),
        .Cin(C1),
        .Sum(Sum1),
        .Cout(C2)
    );

    one_bit_adder U2 (
        .A(A2),
        .B(B2),
        .Cin(C2),
        .Sum(Sum2),
        .Cout(C3)
    );

    one_bit_adder U3 (
        .A(A3),
        .B(B3),
        .Cin(C3),
        .Sum(Sum3),
        .Cout(Cout)
    );
endmodule
