`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
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
    always @(ALU_op or Opcode_field)
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
        endcase
    endcase
    end
endmodule
