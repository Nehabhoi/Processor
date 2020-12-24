`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 12.09.2020 17:20:00
// Design Name: 
// Module Name: LEGv8ALUwithControl
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


module LEGv8ALUwithControl (ALUOp, Opcode_field, A, B, ALU_result, Zero);
//Declare inputs and outputs and intermediate 'wires'     
    input  [1:0]  ALUOp;    
    input  [10:0]  Opcode_field;     
    input  [63:0]  A;     
    input  [63:0]  B;     
    output  [63:0]  ALU_result;     
    output  Zero;    
    
    wire  [3:0]  ALU_operation;
    //Instantiate the two units
    LEGv8ALU_control   ALU_ctrl( .ALU_operation(ALU_operation), .Opcode_field(Opcode_field),   .ALU_op(ALUOp)); 
    LEGv8ALU ALU_unit(.ALU_operation(ALU_operation), .A(A), .B(B),  .ALU_result(ALU_result), .Zero(Zero));
    
    endmodule
