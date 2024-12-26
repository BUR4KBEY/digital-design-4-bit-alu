`timescale 1ns / 1ps



module Alu_Project(
        input [3:0] A,           
        input [3:0] B,      
        input [2:0] opcode,      
        input [1:0] screen,      
        input carry_in,
        output reg [7:0] result,
        output reg carry_out,    
        output reg overflow,     
        output reg [6:0] seg_1,  
        output reg [6:0] seg_2,  
        output reg [6:0] seg_3,
        output reg [3:0] display_1,
        output reg [3:0] display_2,
        output reg [3:0] display_3   
    );
    
    localparam addition = 3'b000, 
               subtraction = 3'b001, 
               multiplication = 3'b010, 
               logicAnd = 3'b011, 
               logicOr = 3'b100, 
               logicXor = 3'b101;
 
    //Function to convert binary number to 7-segment display encoding
    function [6:0] binary_to_7seg;
        input [3:0] binary_num; 
        begin
            case (binary_num)
                4'b0000: binary_to_7seg = 7'b1000000; // Display 0
                4'b0001: binary_to_7seg = 7'b1111001; // Display 1
                4'b0010: binary_to_7seg = 7'b0100100; // Display 2
                4'b0011: binary_to_7seg = 7'b0110000; // Display 3
                4'b0100: binary_to_7seg = 7'b0011001; // Display 4
                4'b0101: binary_to_7seg = 7'b0010010; // Display 5
                4'b0110: binary_to_7seg = 7'b0000010; // Display 6
                4'b0111: binary_to_7seg = 7'b1111000; // Display 7
                4'b1000: binary_to_7seg = 7'b0000000; // Display 8
                4'b1001: binary_to_7seg = 7'b0010000; // Display 9
                default: binary_to_7seg = 7'b1111111; // Error state
            endcase
        end
   endfunction

    
    always @(*) begin
        carry_out = 0; 
        overflow = 0;  
        
        //ALU operations based on the opcode
        case (opcode)
            addition: begin
                if (carry_in == 0) begin
                    {carry_out, result[3:0]} = A + B; 
                    result[7:4] = 4'b0000;
                end
                else begin
                    {carry_out, result[3:0]} = A + B + carry_in;
                    result[7:4] = 4'b0000;
                end
            end
            subtraction: begin
                if(carry_in == 0) begin
                    {carry_out, result[3:0]} = A - B; 
                    result[7:4] = 4'b0000;
                end
                else begin
                    {carry_out, result[3:0]} = A - B - carry_in;
                    result[7:4] = 4'b0000;
                end
            end
            multiplication: result = A * B;
            logicAnd: result = A & B; 
            logicOr: result = A | B;  
            logicXor: result = A ^ B; 
            default: result = 4'b0000;
        endcase

        //Check for overflow in addition and subtraction
        if (((opcode == addition) && carry_out)) begin
                overflow = 1;
        end
        
        //Control the display output based on screen
        case (screen)
            2'b00: begin
                seg_1 = binary_to_7seg(4'b0000); 
                seg_2 = binary_to_7seg(4'b0000);             
                seg_3 = binary_to_7seg({1'b0, opcode});     
                display_1 = 4'b0000;
                display_2 = 4'b0000;
                display_3 = {1'b0, opcode};                     
            end

            2'b01: begin
                if(A >= 10) begin
                    seg_1 = binary_to_7seg(4'b0000);   
                    seg_2 = binary_to_7seg(A / 10);   
                    seg_3 = binary_to_7seg(A %10);  
                    display_1 = 4'b0000;   
                    display_2 = A / 10;   
                    display_3 = A % 10;  
                end
                
                else begin
                    seg_1 = binary_to_7seg(4'b0000);
                    seg_2 = binary_to_7seg(4'b0000);
                    seg_3 = binary_to_7seg(A);
                    
                    display_1 = 4'b0000 ;   
                    display_2 = 4'b0000;   
                    display_3 = A;     
                end               
            end

            2'b10: begin
                if(B >= 10) begin
                    seg_1 = binary_to_7seg(4'b0000);   
                    seg_2 = binary_to_7seg(B / 10);   
                    seg_3 = binary_to_7seg(B % 10);  
                    display_1 = 4'b0000;   
                    display_2 = B / 10;   
                    display_3 = B % 10;  
                end
                
                else begin
                    seg_1 = binary_to_7seg(4'b0000);
                    seg_2 = binary_to_7seg(4'b0000);
                    seg_3 = binary_to_7seg(B);
                    
                    display_1 = 4'b0000;   
                    display_2 = 4'b0000;   
                    display_3 = B;     
                end  
            end


            2'b11: begin
                if (result >= 100) begin
                    
                    seg_1 = binary_to_7seg(result / 100); 
                    seg_2 = binary_to_7seg((result % 100) / 10); 
                    seg_3 = binary_to_7seg(result % 10); 

                    display_1 = result / 100; 
                    display_2 = (result % 100) / 10; 
                    display_3 = result % 10; 
                end 
                else if (result >= 10) begin
                    
                    seg_1 = binary_to_7seg(4'b0000); 
                    seg_2 = binary_to_7seg(result / 10); 
                    seg_3 = binary_to_7seg(result % 10); 

                    display_1 = 4'b0000; 
                    display_2 = result / 10; 
                    display_3 = result % 10; 
                end 
                
                else begin
                    seg_1 = binary_to_7seg(4'b0000);
                    seg_2 = binary_to_7seg(4'b0000);
                    seg_3 = binary_to_7seg(result[3:0]);
                    
                    display_1 = binary_to_7seg(4'b0000);   
                    display_2 = binary_to_7seg(4'b0000);   
                    display_3 = result[3:0];     
                end
            end
            
            default: begin
                seg_1 = binary_to_7seg(4'b0000); 
                seg_2 = binary_to_7seg(4'b0000);
                seg_3 = binary_to_7seg(4'b0000);
                
                display_1 = 4'b0000;
                display_2 = 4'b0000;
                display_3 = 4'b0000;                
            end
        endcase
    end
endmodule
