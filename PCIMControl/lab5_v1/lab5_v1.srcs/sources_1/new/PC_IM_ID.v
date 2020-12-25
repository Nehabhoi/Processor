`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 19.10.2020 02:27:46
// Design Name: 
// Module Name: PC_IM_ID
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


module PC_IM_ID(
    input clk, 
    input reset,
    output Reg2Loc,
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output [1:0] ALUOp
    );
    
    wire [31:0] instruction_out; 
    wire [63:0] adder_out;
    wire [63:0] pc_out;
    
    PC_Adder PC_Adder_Unit(
    .clk(clk),
    .reset(reset),
    .pc_in(adder_out),
    .pc_out(pc_out),
    .adder_out(adder_out)
    );
    
    IM IM_Unit(
    .mem_pc(pc_out),
    .instruction_out(instruction_out)
    );
    
    ID ID_Unit(
    .Opcode(instruction_out[31:21]),
    .Reg2Loc(Reg2Loc),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUOp(ALUOp)
    );
endmodule
