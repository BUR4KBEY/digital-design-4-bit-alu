`timescale 1ns / 1ps



module eight_bus(
         input A0, A1, A2, A3, A4, A5, A6, A7,
         output Y
    );
     assign Y = A0 | A1 | A2 | A3 | A4 | A5 | A6 | A7; 
endmodule
