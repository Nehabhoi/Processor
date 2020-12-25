`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 11:45:56
// Design Name: 
// Module Name: ShiftLeft2
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


module ShiftLeft2(
    inputData,
    outputData
    );
    
    input [63:0] inputData;
    output reg [63:0] outputData;
    
    always@(*)
    begin
        outputData = inputData << 2;
    end
endmodule
