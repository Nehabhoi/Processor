`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha bhoi
// 
// Create Date: 18.10.2020 19:11:31
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();

    reg [63:0] pc_out;
    wire [63:0] adder_out;
    
    adder uut(
    .pc_out(pc_out),
    .adder_out(adder_out)
    );
    
    initial
    begin
        pc_out = 64'h5555555555555555;
        
        #100
        pc_out = 64'haaaaaaaaaaaaaaaa;
        
    end
endmodule
