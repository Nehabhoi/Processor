`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 18.10.2020 19:08:37
// Design Name: 
// Module Name: adder
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


module adder(
    pc_out,
    adder_out
    );
    
    input [63:0] pc_out;
    output reg [63:0] adder_out;
    
    always @(pc_out)
    begin
        adder_out = pc_out + 4;
    end
endmodule
