`timescale 1ns / 1ps


module four_bit_multiplier(
        input A3, A2, A1, A0,
        input B3, B2, B1, B0,
        input enable,
        output Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0
    );
    wire a0b0, a1b0, a2b0, a3b0;
    wire a0b1, a1b1, a2b1, a3b1;
    wire a0b2, a1b2, a2b2, a3b2;
    wire a0b3, a1b3, a2b3, a3b3;
    
    wire P[11:0];
    wire C[2:0];
    
    assign a0b0 = A0 & B0;
    assign a1b0 = A1& B0;
    assign a2b0 = A2 & B0;
    assign a3b0 = A3 & B0;
    
    assign a0b1 = A0 & B1;
    assign a1b1 = A1 & B1;
    assign a2b1 = A2 & B1;
    assign a3b1 = A3 & B1;
    
    assign a0b2 = A0 & B2;
    assign a1b2 = A1 & B2;
    assign a2b2 = A2 & B2;
    assign a3b2 = A3 & B2;
    
    assign a0b3 = A0 & B3;
    assign a1b3 = A1 & B3;
    assign a2b3 = A2 & B3;
    assign a3b3 = A3 & B3;  
    
    four_bit_adder_without_enable U0 (
        .A0(a0b1),
        .A1(a1b1),
        .A2(a2b1),
        .A3(a3b1),
        .B0(a1b0),
        .B1(a2b0),
        .B2(a3b0),
        .B3(1'b0),
        .Cin(1'b0),
        .Sum0(P[0]),
        .Sum1(P[1]),
        .Sum2(P[2]),
        .Sum3(P[3]),
        .Cout(C[0])
    );
    
    four_bit_adder_without_enable U1 (
        .A0(a0b2),
        .A1(a1b2),
        .A2(a2b2),
        .A3(a3b2),
        .B0(P[1]),
        .B1(P[2]),
        .B2(P[3]),
        .B3(C[0]),
        .Cin(1'b0),
        .Sum0(P[4]),
        .Sum1(P[5]),
        .Sum2(P[6]),
        .Sum3(P[7]),
        .Cout(C[1])
    );
    
    four_bit_adder_without_enable U2 (
        .A0(a0b3),
        .A1(a1b3),
        .A2(a2b3),
        .A3(a3b3),
        .B0(P[5]),
        .B1(P[6]),
        .B2(P[7]),
        .B3(C[1]),
        .Cin(1'b0),
        .Sum0(P[8]),
        .Sum1(P[9]),
        .Sum2(P[10]),
        .Sum3(P[11]),
        .Cout(C[2])
    );
    
    assign Y0 = (enable) ? a0b0 : 1'b0;
    assign Y1 = (enable) ? P[0] : 1'b0;
    assign Y2 = (enable) ? P[4] : 1'b0;
    assign Y3 = (enable) ? P[8] :1'b0;
    assign Y4 = (enable) ? P[9] : 1'b0;
    assign Y5 = (enable) ? P[10] : 1'b0;
    assign Y6 = (enable) ? P[11] : 1'b0;
    assign Y7 = (enable) ? C[2] : 1'b0; 
    
endmodule
