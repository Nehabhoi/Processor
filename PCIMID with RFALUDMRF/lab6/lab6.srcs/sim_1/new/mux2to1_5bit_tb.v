`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 27.10.2020 14:46:00
// Design Name: 
// Module Name: mux2to1_5bit_tb
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


module mux2to1_5bit_tb();

    reg [4:0] In0;
    reg [4:0] In1;
    reg Sel;
    wire [4:0]Out;

    mux2to1_5bit uut(
    .In0(In0),
    .In1(In1),
    .Sel(Sel),
    .Out(Out)
    );
    
    initial
    begin
        In0 = 5'b000000;
        In1 = 5'b11111;
        
        #100;
        Sel = 0;
        
        #100
        Sel = 1;
    end
endmodule
