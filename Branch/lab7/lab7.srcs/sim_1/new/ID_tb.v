`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 16:33:42
// Design Name: 
// Module Name: ID_tb
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


module ID_tb();

    reg [10:0]Opcode;
    wire Reg2Loc;
    wire ALUSrc;
    wire MemtoReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire Branch;
    wire [1:0] ALUOp;
    
    ID uut(
    .Opcode(Opcode),
    .Reg2Loc(Reg2Loc),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUOp(ALUOp)
    );
    
    initial
    begin
        //LDUR instruction
        Opcode= 11'b11111000010;
            
        //STUR instruction
        #100 Opcode=11'b11111000000; 
            
        //R-Type instruction    
        #100 Opcode= 11'b10001011000; //Add
        #100 Opcode= 11'b11001011000; //Sub
        #100 Opcode= 11'b10001010000; //And
        #100 Opcode= 11'b10101010000; //Or
    end
endmodule
