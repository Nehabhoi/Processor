`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 11:48:39
// Design Name: 
// Module Name: ShiftLeft2_tb
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


module ShiftLeft2_tb();

    reg [63:0] inputData;
    wire [63:0] outputData;
    
    ShiftLeft2 uut(
    .inputData(inputData),
    .outputData(outputData)
    );
    
    initial 
    begin
        inputData = 64'h0000000000000002;
    #100 inputData = 64'h0000000000000008;
    end
endmodule
