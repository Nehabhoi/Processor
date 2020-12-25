`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 19.10.2020 02:36:09
// Design Name: 
// Module Name: PC_IM_ID_tb
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


module PC_IM_ID_tb();

    reg clk; 
    reg reset;
    wire Reg2Loc;
    wire ALUSrc;
    wire MemtoReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire Branch;
    wire [1:0] ALUOp;
    
    PC_IM_ID uut(
    .clk(clk), 
    .reset(reset),
    .Reg2Loc(Reg2Loc),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUOp(ALUOp)
    );
    
    always @(posedge clk)
    begin
        #10
        clk = ~clk;
    end
    
    always @(negedge clk)
    begin
        #90
        clk = ~clk;
    end
    
    initial
    begin
        clk=0;
        reset=1;
        #100 reset=0;
                
    end   
endmodule
