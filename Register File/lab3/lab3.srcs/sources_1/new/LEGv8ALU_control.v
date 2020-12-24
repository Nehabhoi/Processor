`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 12.09.2020 15:47:39
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
    /*always @(ALU_op or Opcode_field)
    begin
    casex(ALU_op)
    2'b00:
        ALU_operation=4'b1100;
    2'bx1:
        ALU_operation=4'b0111;
    2'b1x:
        casex(Opcode_field)
        11'b10001011000: ALU_operation=4'b0010;
        11'b11001011000: ALU_operation=4'b0110;
        11'b10001010000: ALU_operation=4'b0000;
        11'b10101010000: ALU_operation=4'b0001;
        default: ALU_operation <= 4'bz;
        endcase
    default: ALU_operation <= 4'bz;
    endcase
    end*/
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
