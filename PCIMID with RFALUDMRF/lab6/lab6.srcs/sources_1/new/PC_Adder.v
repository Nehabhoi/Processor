`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 27.10.2020 13:38:27
// Design Name: 
// Module Name: PC_Adder
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


module PC_Adder(
    clk,
    reset,
    pc_out
    );
    
    input clk;
    input reset;
    input  [63:0] pc_out;
    wire [63:0] adder_out;
    
    
    PC PC_Unit(
    .clk(clk),
    .reset(reset),
    .pc_in(adder_out),
    .pc_out(pc_out)
    );
    
    adder adder_Unit(
    .pc_out(pc_out),
    .adder_out(adder_out)
    );
endmodule
