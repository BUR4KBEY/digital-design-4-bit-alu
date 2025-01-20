`timescale 1ns / 1ps



module four_bit_adder(
        input A3, A2, A1, A0,       
        input B3, B2, B1, B0,      
        input Cin,                   
        input Enable,                
        output Sum3, Sum2, Sum1, Sum0,  
        output Cout                
    );
    wire S0, S1, S2, S3;
    wire C1, C2, C3;

    one_bit_adder U0 (
        .A(A0),
        .B(B0),
        .Cin(Cin),
        .Sum(S0),
        .Cout(C1)
    );

    one_bit_adder U1 (
        .A(A1),
        .B(B1),
        .Cin(C1),
        .Sum(S1),
        .Cout(C2)
    );

    one_bit_adder U2 (
        .A(A2),
        .B(B2),
        .Cin(C2),
        .Sum(S2),
        .Cout(C3)
    );

    one_bit_adder U3 (
        .A(A3),
        .B(B3),
        .Cin(C3),
        .Sum(S3),
        .Cout(Cout)
    );

    assign Sum0 = Enable ? S0 : 1'b0;
    assign Sum1 = Enable ? S1 : 1'b0;
    assign Sum2 = Enable ? S2 : 1'b0;
    assign Sum3 = Enable ? S3 : 1'b0;
    
endmodule
