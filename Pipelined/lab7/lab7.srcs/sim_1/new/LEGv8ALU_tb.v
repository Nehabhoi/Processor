`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 15:50:55
// Design Name: 
// Module Name: LEGv8ALU_tb
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


module LEGv8ALU_tb();
    
    //Input
    reg [3:0] ALU_operation;
    reg [63:0] A;
    reg [63:0] B;
    
    //Output
    wire [63:0] ALU_result;
    wire Zero;
    
    //Initiate th module
    LEGv8ALU uut(.ALU_operation(ALU_operation),.A(A),.B(B),.ALU_result(ALU_result),.Zero(Zero));
    
    initial
    begin
    A =  64'h5555555555555555;
    B = 64'haaaaaaaaaaaaaaaa;
    
    //  Logical and 
    ALU_operation  = 4'b0000;
    
    //  Logical or
    #100 
    ALU_operation  = 4'b0001;
    
    // Addition
    #100 
    ALU_operation  = 4'b0010;
    
    // Subtraction
    #100 
    ALU_operation  = 4'b0110;
    
    // Pass input B
    #100 
    ALU_operation  = 4'b0111;
    
    //  Logical nor
    #100 
    ALU_operation  = 4'b1100;
    
    end
endmodule