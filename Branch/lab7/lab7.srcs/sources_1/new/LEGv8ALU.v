`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 15:50:04
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

always @(ALU_operation or A or B)
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
        
        default: 
        begin
        ALU_result = 64'hz;
        Zero = (ALU_result == 64'b0);
        end
    endcase
end

endmodule
