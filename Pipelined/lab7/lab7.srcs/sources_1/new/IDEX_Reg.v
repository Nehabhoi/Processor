`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 26.11.2020 14:34:09
// Design Name: 
// Module Name: IDEX_Reg
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


module IDEX_Reg(clk, ALUSrc_in,MemtoReg_in,RegWrite_in,MemRead_in,MemWrite_in,Branch_in, ALUOp_in,
             ALUSrc_out,MemtoReg_out,RegWrite_out,MemRead_out,MemWrite_out,Branch_out, ALUOp_out,
             PC_in, PC_out, ReadData1_in, ReadData1_out, ReadData2_in, ReadData2_out, SE_in, SE_out,
             opcode_in, opcode_out, writeadd_in, writeadd_out    );
             
    //Control
    input clk;
    input ALUSrc_in,MemtoReg_in,RegWrite_in,MemRead_in,MemWrite_in,Branch_in;
    input [1:0] ALUOp_in;
    output reg ALUSrc_out,MemtoReg_out,RegWrite_out,MemRead_out,MemWrite_out,Branch_out;
    output reg[1:0] ALUOp_out;
    
    //PC
    input [63:0] PC_in;
    output reg[63:0] PC_out;
    
    //RF
    input [63:0] ReadData1_in;
    input [63:0] ReadData2_in;
    output reg [63:0] ReadData1_out;
    output reg [63:0] ReadData2_out;
    
    //SE
    input [63:0] SE_in;
    output reg [63:0] SE_out;
    
    //opcode
    input [10:0] opcode_in;
    output reg [10:0] opcode_out;
    
    //write address
    input [4:0] writeadd_in;
    output reg [4:0] writeadd_out;  
    
    always @(posedge clk)
    begin
    
      
       ALUSrc_out <= ALUSrc_in;
       MemtoReg_out <= MemtoReg_in;
       RegWrite_out <= RegWrite_in;
       MemRead_out <= MemRead_in;
       MemWrite_out <= MemWrite_in;
       Branch_out <= Branch_in; 
       ALUOp_out <= ALUOp_in;
       
       ReadData1_out <= ReadData1_in;
       ReadData2_out <= ReadData2_in;
       
       SE_out <= SE_in;
       PC_out <= PC_in; 
       opcode_out <= opcode_in;
       
       writeadd_out <= writeadd_in;
            
    end
endmodule
