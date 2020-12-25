`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha bhoi
// 
// Create Date: 19.10.2020 01:48:58
// Design Name: 
// Module Name: PC_IM
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


module PC_IM(
    input clk,
    input reset,
    input [63:0] pc_in,
    wire[63:0]pc_out,
    wire [63:0] adder_out,
    wire [31:0]instruction_out
    );
    
    PC_Adder PC_Adder_Unit(
    .clk(clk),
    .reset(reset),
    .pc_in(adder_out),
    .pc_out(pc_out),
    .adder_out(adder_out)
    );
    
    IM IM_Unit(
    .mem_pc(pc_out),
    .instruction_out(instruction_out)
    );
endmodule
