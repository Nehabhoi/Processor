`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 26.11.2020 15:10:12
// Design Name: 
// Module Name: MEMWB_Reg
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


module MEMWB_Reg(clk, MemtoReg_in, RegWrite_in, ReadData_in, ALUResult_in, WriteAdd_in, MemtoReg_out, 
              RegWrite_out, ReadData_out, ALUResult_out, WriteAdd_out
    );
    
    input clk;
    input MemtoReg_in, RegWrite_in;
    input [63:0] ReadData_in;
    input [63:0] ALUResult_in;
    input [4:0] WriteAdd_in;
     output reg MemtoReg_out, RegWrite_out;
     output reg [63:0] ReadData_out;
     output reg [63:0] ALUResult_out;
     output reg [4:0] WriteAdd_out;
    
    
    always @(posedge clk)
    begin
      MemtoReg_out <= MemtoReg_in;
      RegWrite_out <= RegWrite_in;
      ReadData_out <=  ReadData_in;
      ALUResult_out <= ALUResult_in; 
      WriteAdd_out <= WriteAdd_in;
    end
endmodule
