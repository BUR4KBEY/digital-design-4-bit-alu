`timescale 1ns / 1ps


module Alu_project_test(
    
    );
    
    reg [3:0] A;           
    reg [3:0] B;           
    reg [2:0] opcode;      
    reg [1:0] screen; 
    reg carry_in;     

    
    wire [7:0] result; 
    wire carry_out;    
    wire overflow;     
    wire [6:0] seg_1;  
    wire [6:0] seg_2;  
    wire [6:0] seg_3;   
    wire [3:0] display_1;
    wire [3:0] display_2;
    wire [3:0] display_3;
    
    
    Alu_Project uut (
        .A(A),           
        .B(B),           
        .opcode(opcode),  
        .screen(screen),
        .carry_in(carry_in),  
        .result(result), 
        .carry_out(carry_out),    
        .overflow(overflow),     
        .seg_1(seg_1),  
        .seg_2(seg_2),  
        .seg_3(seg_3),   
        .display_1(display_1),
        .display_2(display_2),
        .display_3(display_3)
    );


    initial begin
        A = 4'b0000;
        B = 4'b0000;
        opcode = 3'b000;  
        screen = 2'b00;
        carry_in = 1'b0;
        #40;


        // Test 1: Addition
        A = 4'b0101; B = 4'b0011; // A=5, B=3
        opcode = 3'b000; 
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20
        screen = 2'b11;
        #20;
        carry_in = 1'b0;
        #20;
        carry_in = 1'b0;
       
       
        // Test 2: Subtraction
        A = 4'b1001; B = 4'b0110; // A=9, B=6
        opcode = 3'b001; 
        screen = 2'b00;
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20;
        screen = 2'b11;
        #20;
        carry_in = 1'b1;
        #20;
        carry_in = 1'b0;
        
        
        // Test 3: Multiplication
        A = 4'b0011; B = 4'b0010; // A=3, B=2
        opcode = 3'b010;
        screen = 2'b00; 
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20
        screen = 2'b11;
        #20;
        
        
        // Test 4: Logic AND
        A = 4'b1010; B = 4'b1011; // A=10, B=11
        opcode = 3'b011; 
        screen = 2'b00;
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20;
        screen = 2'b11;
        #20;
        
        
        // Test 5: Logic OR
        A = 4'b0101; B = 4'b0010; // A=5, B=2
        opcode = 3'b100; 
        screen = 2'b00;
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20;
        screen = 2'b11;
        #20;
        
        
        
        // Test 6: Logic XOR
        A = 4'b0110; B = 4'b1001; // A=6, B=9
        opcode = 3'b101;
        screen = 2'b00;
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20;
        screen = 2'b11;
        #20;
        
        
        // Test 7: Addition(Overflow)
        A = 4'b1111; B = 4'b0101; // A=15, B=5 
        opcode = 3'b000;
        screen = 2'b00;
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20;
        screen = 2'b11;
        #20;
        carry_in = 1;
        #20
        carry_in = 0;
        
        
        // Test 8 : Multiplication 
        A = 4'b1010; B = 4'b1100;  // A = 10, B = 12
        opcode = 3'b010;
        screen = 2'b00;
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20;
        screen = 2'b11;
        #20;
        
        // Test 9 Subtraction(Overflow)
        A = 4'b0010; B = 4'b1010;  // A = 2, B = 10
        opcode = 3'b001;
        screen = 2'b00;
        #20;
        screen = 2'b01;
        #20;
        screen = 2'b10;
        #20;
        screen = 2'b11;
        #20;
        carry_in = 1;
        #20;
        
        $finish;
    end

    
    initial begin
        $monitor("Time: %0t | A: %b | B: %b | opcode: %b | screen: %b | result: %d | carry_out: %b | overflow: %b | seg_1: %b | seg_2: %b | seg_3: %b | display_1: %d | display_2: %d | display_3: %d "  ,
                 $time, A, B, opcode, screen, result, carry_out, overflow, seg_1, seg_2, seg_3, display_1, display_2, display_3);
    end

endmodule
