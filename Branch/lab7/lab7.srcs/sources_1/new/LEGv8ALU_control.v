`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 15:41:27
// Design Name: 
// Module Name: LEGv8ALU_control
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


module LEGv8ALU_control (ALU_operation, Opcode_field,  ALU_op); 
    input [1:0] ALU_op;
    input [10:0] Opcode_field;
    output reg [3:0] ALU_operation;
    always @(ALU_op, Opcode_field)
casex({ALU_op, Opcode_field})  
13'b1x10001010000: ALU_operation <= 0;    // 0 => AND (R type)
13'b1x10101010000: ALU_operation <= 1;    // 1 => OR (R type)
13'b1x10001011000: ALU_operation <= 2;    // 2 => ADD (R type)
13'b1x11001011000: ALU_operation <= 6;    // 6 => SUBTRACT (R type)
13'bx1xxxxxxxxxxx: ALU_operation <= 7;    // 7 => PASS INPUT B (R type)
13'b0011111000010: ALU_operation <= 2;    // 2 => LDUR : Address Add (D type)
13'b0011111000000: ALU_operation <= 2;    // 2 => STUR : Address Add (D type)
13'b00xxxxxxxxxxx: ALU_operation <= 12;   // C => NOR ~(A|B) (R type)
default: ALU_operation <= 4'bz;
endcase
    
endmodule
