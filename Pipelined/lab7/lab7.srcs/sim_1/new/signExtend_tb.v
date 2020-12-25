`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 14:41:05
// Design Name: 
// Module Name: signExtend_tb
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


module signExtend_tb();

    //Input
    reg [31:0] offset;
    
    //Output
    wire [63:0] signExtend_offset;
    
    signExtend uut(
    .offset(offset),
    .signExtend_offset(signExtend_offset)
    );
    
    initial
    begin
    offset = 32'b00010100000000000000000000000111;
    #100
    offset = 32'b10110100000000000000000001100000;
    #100
    offset = 32'b00000000000000000100000000000000;
    end

endmodule
