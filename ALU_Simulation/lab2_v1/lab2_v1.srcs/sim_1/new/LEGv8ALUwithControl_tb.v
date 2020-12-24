`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 12.09.2020 17:22:30
// Design Name: 
// Module Name: LEGv8ALUwithControl_tb
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


module LEGv8ALUwithControl_tb();
    
    //Input
    reg  [1:0]  ALUOp;        
    reg  [10:0]  Opcode_field;     
    reg  [63:0]  A;     
    reg  [63:0]  B;     
    
    //Output
    wire  [63:0]  ALU_result;     
    wire  Zero;
    
    
    LEGv8ALUwithControl uut(.ALUOp(ALUOp), .Opcode_field(Opcode_field), .A(A), .B(B), .ALU_result(ALU_result), .Zero(Zero));
   
    initial
    begin
    
    A =  64'h5555555555555555;
    B = 64'haaaaaaaaaaaaaaaa;
    
    // AND 0000
    ALUOp = 2'b10;
    Opcode_field = 11'b10001010000;
    
    // OR 0001
    #100
    ALUOp = 2'b10;
    Opcode_field = 11'b10101010000;
    
    // ADD 0010
    #100
    ALUOp = 2'b10;
    Opcode_field = 11'b10001011000;
    
    // SUB 0110
    #100
    ALUOp = 2'b10;
    Opcode_field = 11'b11001011000;
    
    // Pass B 0111
    #100
    ALUOp = 2'b01;
    Opcode_field = 11'b10001010000;
    
    // NOR 1100
    #100
    ALUOp = 2'b00;
    Opcode_field = 11'b10001010000;
    
    end
endmodule
