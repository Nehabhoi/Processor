`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 26.11.2020 17:40:25
// Design Name: 
// Module Name: IDEX_Reg_tb
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


module IDEX_Reg_tb();

    //Control
    reg clk;
    reg ALUSrc_in,MemtoReg_in,RegWrite_in,MemRead_in,MemWrite_in,Branch_in;
    reg [1:0] ALUOp_in;
    wire ALUSrc_out,MemtoReg_out,RegWrite_out,MemRead_out,MemWrite_out,Branch_out;
    wire[1:0] ALUOp_out;
    
    //PC
    reg [63:0] PC_in;
    wire[63:0] PC_out;
    
    //RF
    reg [63:0] ReadData1_in;
    reg [63:0] ReadData2_in;
    wire [63:0] ReadData1_out;
    wire [63:0] ReadData2_out;
    
    //SE
    reg [63:0] SE_in;
    wire [63:0] SE_out;
    
    //opcode
    reg [10:0] opcode_in;
    wire [10:0] opcode_out;
    
    //write address
    reg [4:0] writeadd_in;
    wire [4:0] writeadd_out;
    
    IDEX_Reg uut(
    .clk(clk), 
    .ALUSrc_in(ALUSrc_in),
    .MemtoReg_in(MemtoReg_in),
    .RegWrite_in(RegWrite_in),
    .MemRead_in(MemRead_in),
    .MemWrite_in(MemWrite_in),
    .Branch_in(Branch_in), 
    .ALUOp_in(ALUOp_in),
    .ALUSrc_out(ALUSrc_out),
    .MemtoReg_out(MemtoReg_out),
    .RegWrite_out(RegWrite_out),
    .MemRead_out(MemRead_out),
    .MemWrite_out(MemWrite_out),
    .Branch_out(Branch_out), 
    .ALUOp_out(ALUOp_out),
    .PC_in(PC_in), 
    .PC_out(PC_out), 
    .ReadData1_in(ReadData1_in), 
    .ReadData1_out(ReadData1_out), 
    .ReadData2_in(ReadData2_in), 
    .ReadData2_out(ReadData2_out),
    .SE_in(SE_in), 
    .SE_out(SE_out),
    .opcode_in(opcode_in), 
    .opcode_out(opcode_out), 
    .writeadd_in(writeadd_in), 
    .writeadd_out(writeadd_out)
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
    ALUSrc_in=0;
    MemtoReg_in=0;
    RegWrite_in=0;
    MemRead_in=0;
    MemWrite_in=0;
    Branch_in = 0;
    
    ALUOp_in = 2'b01;
    
    PC_in = 64'hffffffffffffffff;
    ReadData1_in = 64'haaaaaaaaaaaaaaaa;
    ReadData2_in = 64'hbbbbbbbbbbbbbbbb;
    SE_in = 64'h0000000000001111;
    opcode_in = 11'b00000000111;
    writeadd_in = 5'b00011;
    end
endmodule
