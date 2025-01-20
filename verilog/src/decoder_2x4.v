`timescale 1ns / 1ps


module decoder_2x4(
        input A1,   
        input A0,   
        output Y0,  
        output Y1,  
        output Y2,  
        output Y3   
    );
    assign Y0 = (~A1 & ~A0);  
    assign Y1 = (~A1 & A0);   
    assign Y2 = (A1 & ~A0);    
    assign Y3 = (A1 & A0);    
endmodule
