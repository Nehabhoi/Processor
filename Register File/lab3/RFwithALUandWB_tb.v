`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
// Engineer: Neha Bhoi
// 
// Create Date: 23.09.2020 18:14:21
// Design Name: 
// Module Name: RFwithALUandWB_tb
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


module RFwithALUandWB_tb();

    reg [1:0] ALUOp;
    reg [10:0] Opcode_field;
    reg clk;
    reg reset;
    reg wr_en;
    reg [4:0] rd_addr_1;
    reg [4:0] rd_addr_2;
    reg [4:0] wr_addr;
    reg [63:0] d_in;
    wire [63:0] ALU_result;
    wire Zero;
    reg WB;
    
    RFwithALUandWB uut(
    .ALUOp(ALUOp),
    .Opcode_field(Opcode_field),
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_addr_1(rd_addr_1),
    .rd_addr_2(rd_addr_2),
    .wr_addr(wr_addr),
    .d_in(d_in),
    .ALU_result(ALU_result),
    .Zero(Zero),
    .WB(WB)
    );
    initial
    begin
    // reset
    clk = 0;
    reset = 1;
    wr_en = 1;
    WB = 0;
    
    #50
    clk = 1;
    #50
    clk = 0;
    
    //wirte to A 
    #50
    wr_en = 1;
    reset = 0;
    wr_addr = 5'b00101;
    d_in = 64'h5555555555555555;
    clk = 1;
    #50
    clk = 0;
    
    //wirte to B
    #50
    wr_en = 1;
    reset = 0;
    wr_addr = 5'b01010;
    d_in = 64'haaaaaaaaaaaaaaaa;
    clk = 1;
    
    //Initialize A and B for Operation
    #50
    wr_en = 0;
    rd_addr_1 = 5'b00101;
    rd_addr_2 = 5'b01010;
    clk = 0;
    
    // ADD 0010
    #50
    ALUOp = 2'b10;
    Opcode_field = 11'b10001011000;
    clk = 1;
    
    #50
    clk = 0;
    
    //Store result of ADD to destination register
    #50
    wr_en = 1;
    wr_addr = 5'b01110;
    clk = 1;
    
    //read result of ADD operration from destination register
    #50
    wr_en = 0;
    rd_addr_1 = 5'b01110;
    clk = 0;
    
    
    
    end
endmodule
