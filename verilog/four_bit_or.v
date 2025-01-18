`timescale 1ns / 1ps



module four_bit_or(
        input wire A0, A1, A2, A3,  
        input wire B0, B1, B2, B3, 
        input wire enable,           
        output wire Y0, Y1, Y2, Y3   
    );
    wire tempY0, tempY1, tempY2, tempY3;
    
    assign tempY0 = A0 | B0;
    assign tempY1 = A1 | B1;
    assign tempY2 = A2 | B2;
    assign tempY3 = A3 | B3;
    
    assign Y0 = (enable) ? tempY0 : 1'b0;
    assign Y1 = (enable) ? tempY1 : 1'b0;
    assign Y2 = (enable) ? tempY2 : 1'b0;
    assign Y3 = (enable) ? tempY3 : 1'b0;
endmodule
