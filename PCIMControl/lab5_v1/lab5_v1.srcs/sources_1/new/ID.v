`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 19.10.2020 02:14:01
// Design Name: 
// Module Name: ID
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


module ID(
    input [10:0]Opcode,
    output reg Reg2Loc,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg [1:0] ALUOp
    );
    
    always@(*) 
        case (Opcode)
        
        //LDUR Instruction
        11'b11111000010: 
        begin
            Reg2Loc<=0;
            ALUSrc <= 1;
            MemtoReg <= 1;
            RegWrite <= 1;
            MemRead <= 1;
            MemWrite <= 0;
            Branch <=0;
            ALUOp <= 2'b00;
        end
        
        //STUR Instruction
        11'b11111000000:  
        begin
            Reg2Loc <= 1;
            ALUSrc <= 1;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 1;
            Branch <=0;
            ALUOp <= 2'b00;
        end 
        
        //R-Type Instructions
        11'b10001011000,11'b11001011000,11'b10001010000,11'b10101010000: 
        begin
            Reg2Loc <= 0;
            ALUSrc <= 0;
            MemtoReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <=0;
            ALUOp <= 2'b10;
        end                          
        endcase
endmodule
