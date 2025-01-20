`timescale 1ns / 1ps



module one_bit_subs(
        input A,
        input B,
        input Bin, 
        output Diff,  
        output Bout
    );
    assign Diff = A ^ B ^ Bin;  
    assign Bout = (~A & B) | ((~(A^B)) & Bin);
endmodule
