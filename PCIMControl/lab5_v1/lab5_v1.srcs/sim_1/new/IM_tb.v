`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 19.10.2020 01:41:38
// Design Name: 
// Module Name: IM_tb
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


module IM_tb();

    reg [63:0] mem_pc;
    wire [31:0] instruction_out;
    
    IM uut(
    .mem_pc(mem_pc),
    .instruction_out(instruction_out)
    );
    
    initial
        begin
            mem_pc=0;
            #100;mem_pc = 4;
            #100;mem_pc = 8;
            #100;mem_pc= 12;
            #100;mem_pc = 16;
            #100;mem_pc = 20;
            #100;mem_pc = 24;
            #100;mem_pc = 28;
            #100;mem_pc = 32;
            #100;mem_pc= 36;
        end
endmodule
