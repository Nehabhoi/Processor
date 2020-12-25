`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 13:51:40
// Design Name: 
// Module Name: mux2to1_5bit
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


module mux2to1_5bit(
    input [4:0] In0,
    input [4:0] In1,
    input Sel,
    output reg [4:0]Out
    );
    
    always@(Sel,In0,In1)
    case(Sel)
    0: Out <= In0;
    1: Out <= In1;
    endcase
endmodule
