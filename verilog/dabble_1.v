`timescale 1ns / 1ps


module dabble_1(
        input A,B,C,D,
        output E,F,G,H
    );
    wire /*O0, O1, O2, O3, O4,*/ O5,O6,O7,O8;
    
    //assign O0 = A^D;
    //assign O1 = ~(A|B);
    //assign O2 = A^C;
    //assign O3 = ~((A^D)|(A^C));
    //assign O4 = (A^D)|(~(A|B));
    assign O5 = ~((~((A^D)|(A^C))) |(~(A|B)));
    assign O6 = ~(C|((A^D)|(~(A|B))));
    assign O7 = (A^C) & ((A^D)|(~(A|B)));
    assign O8 = (~((~((A^D)|(A^C))) |(~(A|B)))) ^ D;
    
    assign E = O5;
    assign F = O6;
    assign G = O7;
    assign H = O8;
endmodule
