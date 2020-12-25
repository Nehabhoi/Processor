`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 26.11.2020 14:19:09
// Design Name: 
// Module Name: IFID_Reg_tb
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


module IFID_Reg_tb();

    reg clk;
    reg [63:0] PCOut;
    reg [31:0] Instruction;
    wire [31:0] Instruction_IFID;
    wire [63:0] PCOut_IFID;
    
    IFID_Reg uut(
    .clk(clk), 
    .PCOut(PCOut), 
    .Instruction(Instruction), 
    .Instruction_IFID(Instruction_IFID), 
    .PCOut_IFID(PCOut_IFID)
    );
    
    always @(posedge clk)
    begin 
    #5 
    clk = ~clk; 
    end
    
    always @(negedge clk)
    begin 
    #20
    clk = ~ clk;
    end
    
    initial
    begin
        clk = 0;
        PCOut = 64'h0000000000000000;
        Instruction = 32'h44444444;
    end
endmodule
