`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
// Engineer: Neha Bhoi
// 
// Create Date: 23.09.2020 16:54:18
// Design Name: 
// Module Name: RFwithALUandWB
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


module RFwithALUandWB(
    ALUOp,
    Opcode_field,
    clk,
    reset,
    wr_en,
    rd_addr_1,
    rd_addr_2,
    wr_addr,
    d_in,
    ALU_result,
    Zero,
    WB
    );
    
    input [1:0] ALUOp;
    input [10:0] Opcode_field;
    input clk;
    input reset;
    input wr_en;
    input [4:0] rd_addr_1;
    input [4:0] rd_addr_2;
    input [4:0] wr_addr;
    input [63:0] d_in;
    output [63:0] ALU_result;
    output Zero;
    input WB;
    
    wire  [63:0]  A;
    wire  [63:0]  B;
    wire  [63:0]  data_bus;
    
    regfile regfile_unit(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_addr_1(rd_addr_1),
    .rd_addr_2(rd_addr_2),
    .wr_addr(wr_addr),
    .d_in(data_bus),
    .d_out_1(A),
    .d_out_2(B)
    );
    
    LEGv8ALUwithControl ALU_unit(
    .ALUOp(ALUOp),
    .Opcode_field(Opcode_field),
    .A(A), 
    .B(B), 
    .ALU_result(ALU_result), 
    .Zero(Zero)
    );
    
    assign data_bus = (WB == 1'b1)? ALU_result:d_in;

endmodule
