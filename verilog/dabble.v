`timescale 1ns / 1ps


module dabble(
    input A, B, C, D,
    output E, F, G, H
);
    wire O5, O6, O7, O8;

    assign O5 = ~((~((A ^ D) | (A ^ C))) | (~(A | B)));
    assign O6 = ~(C | ((A ^ D) | (~(A | B))));
    assign O7 = (A ^ C) & ((A ^ D) | (~(A | B)));
    assign O8 = (~((~((A ^ D) | (A ^ C))) | (~(A | B)))) ^ D;

    assign E = O5;
    assign F = O6;
    assign G = O7;
    assign H = O8;
endmodule
