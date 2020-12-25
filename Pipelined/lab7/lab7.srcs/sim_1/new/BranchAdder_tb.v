`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 12:28:19
// Design Name: 
// Module Name: BranchAdder_tb
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


module BranchAdder_tb();
    reg [63:0] PC;
    reg [63:0] BranchAdd;
    wire [63:0] TargetAdd;
    
    BranchAdder uut(
    .PC(PC),
    .BranchAdd(BranchAdd),
    .TargetAdd(TargetAdd)
    );
    
    initial
    begin
        BranchAdd = 64'h0000000000000001;
        PC = 64'h0000000000000000;
        
        #100 
        PC = 64'h0000000000000002;
        BranchAdd = 64'h0000000000000004;
    end
endmodule
