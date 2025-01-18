`timescale 1ns / 1ps


module tristate_buffer(
        input  A,    
        input  EN,  
        output  Y
    );
    assign Y = EN ? A : 1'b0;
endmodule
