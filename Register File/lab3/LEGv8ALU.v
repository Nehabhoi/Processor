`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
// Engineer: Neha Bhoi
// 
// Create Date: 12.09.2020 13:49:40
// Design Name: 
// Module Name: LEGv8ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LEGv8ALU (ALU_operation, A, B, ALU_result, Zero);
input [3:0] ALU_operation;
input [63:0] A, B;
output reg [63:0] ALU_result;
output reg Zero;

always @(ALU_operation or A)
begin
    case(ALU_operation)
        4'b0000: 
        begin
        //  Logical and 
        ALU_result = A & B;
        Zero = (ALU_result == 64'b0);
        end
        
        4'b0001: 
        begin
        //  Logical or
        ALU_result = A | B;
        Zero = (ALU_result == 64'b0);
        end
        
        4'b0010: 
        begin
        // Addition
        ALU_result = A + B ;
        Zero = (ALU_result == 64'b0);
        end
        
        4'b0110: 
        begin
        // Subtraction
        ALU_result = A - B ;
        Zero = (ALU_result == 64'b0);
        end
        
        4'b0111: 
        begin
        // Pass input B
        ALU_result = B ;
        Zero = (ALU_result == 64'b0);
        end
        
        4'b1100: 
        begin
        //  Logical nor
        ALU_result = ~( A | B);
        Zero = (ALU_result == 64'b0);
        end
        default: ALU_result = A + B ;
    endcase
end

endmodule
