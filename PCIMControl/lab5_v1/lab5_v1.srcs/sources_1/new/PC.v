`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 18.10.2020 19:00:09
// Design Name: 
// Module Name: PC
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


module PC(
    clk,
    reset,
    pc_in,
    pc_out
    );
    
    input clk;
    input reset;
    input [63:0] pc_in;
    output reg [63:0] pc_out;
    
    always@(posedge clk)
        begin
            if(reset==1)
                begin
                    pc_out=64'h0000000000000000;
                end
            else
                pc_out=pc_in;
            end 
endmodule
