`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
// Engineer: Neha Bhoi
// 
// Create Date: 26.11.2020 18:08:43
// Design Name: 
// Module Name: EXMEM_reg_tb
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


module EXMEM_reg_tb();

    reg clk;
    reg reset;
    reg MemRead_in, MemWrite_in,  RegWrite_in, MemtoReg_in, Branch_in;
    reg [63:0] BranchAdder_in;
    reg [63:0] ALUResult_in;
    reg ALUZero_in;
    reg [63:0] ReadData2_in;
    reg [4:0] WriteAdd_in;
    wire MemRead_out, MemWrite_out,  RegWrite_out, MemtoReg_out, Branch_out;
    wire [63:0] BranchAdder_out;
    wire [63:0] ALUResult_out;
    wire ALUZero_out;
    wire [63:0] ReadData2_out;
    wire [63:0] WriteAdd_out;
    
    EXMEM_reg uut(
    .clk(clk),
    .reset(reset),  
    .MemRead_in(MemRead_in), 
    .MemWrite_in(MemWrite_in),  
    .RegWrite_in(RegWrite_in), 
    .MemtoReg_in(MemtoReg_in), 
    .Branch_in(Branch_in), 
    .BranchAdder_in(BranchAdder_in), 
    .ALUResult_in(ALUResult_in), 
    .ALUZero_in(ALUZero_in), 
    .ReadData2_in(ReadData2_in), 
    .WriteAdd_in(WriteAdd_in), 
    .MemRead_out(MemRead_out), 
    .MemWrite_out(MemWrite_out),  
    .RegWrite_out(RegWrite_out), 
    .MemtoReg_out(MemtoReg_out), 
    .Branch_out(Branch_out),
    .BranchAdder_out(BranchAdder_out), 
    .ALUResult_out(ALUResult_out), 
    .ALUZero_out(ALUZero_out), 
    .ReadData2_out(ReadData2_out), 
    .WriteAdd_out(WriteAdd_out)
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
    MemRead_in = 0;
    MemWrite_in = 0;
    RegWrite_in = 0 ;
    MemtoReg_in = 0 ;
    Branch_in = 0;
    BranchAdder_in = 64'h0000000000000000;
    ALUResult_in = 64'haaaaaaaaaaaaaaaa;
    ALUZero_in = 0;
    ReadData2_in = 64'h1111111111111111;
    WriteAdd_in =5'b00011;
    
    #50
    reset = 1;    end
endmodule
