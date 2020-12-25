`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 15:43:48
// Design Name: 
// Module Name: LEGv8ALU_control_tb
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


module LEGv8ALU_control_tb();
    
    //Input
    reg [1:0] ALU_op;
    reg [10:0] Opcode_field;
    
    //Output
    wire [3:0] ALU_operation;
    LEGv8ALU_control uut(.ALU_operation(ALU_operation), .Opcode_field(Opcode_field),  .ALU_op(ALU_op));
    
    initial
    begin
    
    //1100
    ALU_op = 2'b00;
    Opcode_field = 11'b00000000000;
    
    //0111
    #100
    ALU_op = 2'b01;
    Opcode_field = 11'b00000000000;
    
    //0010
    #100
    ALU_op = 2'b10;
    Opcode_field = 11'b10001011000;
    
    //0110
    #100
    ALU_op = 2'b10;
    Opcode_field = 11'b11001011000;
    
    //0000
    #100
    ALU_op = 2'b10;
    Opcode_field = 11'b10001010000;
    
    //0001
    #100
    ALU_op = 2'b10;
    Opcode_field = 11'b10101010000;
    
    end
endmodule
