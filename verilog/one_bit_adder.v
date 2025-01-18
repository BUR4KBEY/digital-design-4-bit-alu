`timescale 1ns / 1ps



module one_bit_adder(
        input  A,        
        input  B,        
        input  Cin,      
        output  Sum,    
        output  Cout
    );
    assign Sum = A ^ B ^ Cin;          
    assign Cout = (A & B) | (Cin & (A ^ B)); 
endmodule
