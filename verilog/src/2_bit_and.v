`timescale 1ns / 1ps



module two_bit_and(
        input a,
        input b,
        output y
    );
    assign y = a & b;
endmodule
