`timescale 1ns / 1ps


module four_bit_multiplier(
        input A3, A2, A1, A0,
        input B3, B2 ,B1, B0,
        input enable,
        output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
    );
    
    wire P0, P1, P2, P3, P4, P5, P6, P7;
    wire P8, P9, P10, P11, P12, P13, P14, P15;
    assign P0 = A0 & B0;
    assign P1 = A0 & B1;
    assign P2 = A0 & B2;
    assign P3 = A0 & B3;
    assign P4 = A1 & B0;
    assign P5 = A1 & B1;
    assign P6 = A1 & B2;
    assign P7 = A1 & B3;
    assign P8 = A2 & B0;
    assign P9 = A2 & B1;
    assign P10 = A2 & B2;
    assign P11 = A2 & B3;
    assign P12 = A3 & B0;
    assign P13 = A3 & B1;
    assign P14 = A3 & B2;
    assign P15 = A3 & B3;
    
    wire S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11;
    wire Cout1, Cout2, Cout3;
    
    four_bit_adder_without_enable U0(
        .A0(P1),
        .A1(P5),
        .A2(P9),
        .A3(P13),
        .B0(P4),
        .B1(P8),
        .B2(P12),
        .B3(1'b0),
        .Cin(1'b0),
        .Sum0(S0),
        .Sum1(S1),
        .Sum2(S2),
        .Sum3(S3),
        .Cout(Cout1)
    );
    
    four_bit_adder_without_enable U1(
        .A0(P2),
        .A1(P6),
        .A2(P10),
        .A3(P14),
        .B0(S1),
        .B1(S2),
        .B2(S3),
        .B3(Cout1),
        .Cin(1'b0),
        .Sum0(S4),
        .Sum1(S5),
        .Sum2(S6),
        .Sum3(S7),
        .Cout(Cout2)
    );
    
    four_bit_adder_without_enable U2(
        .A0(P3),
        .A1(P7),
        .A2(P11),
        .A3(P15),
        .B0(S4),
        .B1(S5),
        .B2(S6),
        .B3(Cout2),
        .Cin(1'b0),
        .Sum0(S8),
        .Sum1(S9),
        .Sum2(S10),
        .Sum3(S11),
        .Cout(Cout3)
    );
    
    assign Y0 = (enable) ? P0 : 1'b0;
    assign Y1 = (enable) ? S0 : 1'b0;
    assign Y2 = (enable) ? S4 : 1'b0;
    assign Y3 = (enable) ? S8 : 1'b0;
    assign Y4 = (enable) ? S9 : 1'b0;
    assign Y5 = (enable) ? S10 : 1'b0;
    assign Y6 = (enable) ? S11 : 1'b0;
    assign Y7 = (enable) ? Cout3 : 1'b0;
    
endmodule
