`timescale 1ns / 1ps

module decoder_3x8(
        input A,   
        input B, 
        input C,  
        output Y0,
        output Y1,
        output Y2,
        output Y3,
        output Y4,
        output Y5,
        output Y6,
        output Y7
    );
    assign Y0 = ~A & ~B & ~C; 
    assign Y1 = ~A & ~B &  C;  
    assign Y2 = ~A &  B & ~C;  
    assign Y3 = ~A &  B &  C; 
    assign Y4 =  A & ~B & ~C;  
    assign Y5 =  A & ~B &  C;  
    assign Y6 =  A &  B & ~C;  
    assign Y7 =  A &  B &  C; 
endmodule
