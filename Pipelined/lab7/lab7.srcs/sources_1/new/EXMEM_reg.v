`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 26.11.2020 15:01:11
// Design Name: 
// Module Name: EXMEM_reg
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


module EXMEM_reg(clk,reset,  MemRead_in, MemWrite_in,  RegWrite_in, MemtoReg_in, Branch_in, BranchAdder_in, 
             ALUResult_in, ALUZero_in, ReadData2_in, WriteAdd_in, MemRead_out, MemWrite_out,  
             RegWrite_out, MemtoReg_out, Branch_out,BranchAdder_out, ALUResult_out, ALUZero_out, 
             ReadData2_out, WriteAdd_out

    );
    input clk;
    input reset;
    input MemRead_in, MemWrite_in,  RegWrite_in, MemtoReg_in, Branch_in;
    input [63:0] BranchAdder_in;
    input [63:0] ALUResult_in;
    input ALUZero_in;
    input [63:0] ReadData2_in;
    input [4:0] WriteAdd_in;
    output reg MemRead_out, MemWrite_out,  RegWrite_out, MemtoReg_out, Branch_out;
    output reg [63:0] BranchAdder_out;
    output reg [63:0] ALUResult_out;
    output reg ALUZero_out;
    output reg [63:0] ReadData2_out;
    output reg [63:0] WriteAdd_out;
    
    always@(reset)
    begin
        Branch_out <= 0;
        
        BranchAdder_out <= 0;
        ALUZero_out <= 0;
    end
    always@(posedge clk)
    begin
        MemRead_out <= MemRead_in;
        MemWrite_out <= MemWrite_in;
        RegWrite_out <= RegWrite_in;
        MemtoReg_out <= MemtoReg_in;
        Branch_out <= Branch_in;
        
        BranchAdder_out <= BranchAdder_in;
        ALUResult_out <= ALUResult_in;
        ALUZero_out <= ALUZero_in;
        ReadData2_out <= ReadData2_in;
        WriteAdd_out <= WriteAdd_in;
        
        
    
    end
endmodule
