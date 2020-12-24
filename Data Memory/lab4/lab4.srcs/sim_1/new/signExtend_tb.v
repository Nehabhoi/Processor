`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
// Engineer: Neha Bhoi
// 
// Create Date: 09.10.2020 14:48:00
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
    reg [8:0] offset;
    
    //Output
    wire [63:0] signExtend_offset;
    
    signExtend uut(
    .offset(offset),
    .signExtend_offset(signExtend_offset)
    );
    
    initial
    begin
    offset = 9'b000000000;
    #100 offset = 9'b000001010;
    #100 offset = 9'b000000101;
    end

endmodule
