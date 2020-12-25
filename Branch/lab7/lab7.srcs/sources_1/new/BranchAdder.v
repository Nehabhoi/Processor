`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 12:25:55
// Design Name: 
// Module Name: BranchAdder
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


module BranchAdder(
    PC,
    BranchAdd,
    TargetAdd
    );
    
    input [63:0] PC;
    input [63:0] BranchAdd;
    output reg [63:0] TargetAdd;
    
    always@(*)
    begin
        TargetAdd <= PC + BranchAdd;
    end
endmodule
