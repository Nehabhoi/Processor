`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 26.11.2020 14:16:38
// Design Name: 
// Module Name: IFID_Reg
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


module IFID_Reg(
    clk, 
    PCOut, 
    Instruction, 
    Instruction_IFID, 
    PCOut_IFID
    );
    input clk;
    input [63:0] PCOut;
    input [31:0] Instruction;
    output reg[31:0] Instruction_IFID;
    output reg[63:0] PCOut_IFID;
    
    
    always@(posedge clk)
    begin
        Instruction_IFID <= Instruction;
        PCOut_IFID <= PCOut;
   
    end
endmodule
