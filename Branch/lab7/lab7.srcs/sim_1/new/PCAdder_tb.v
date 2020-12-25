`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 13:10:21
// Design Name: 
// Module Name: PCAdder_tb
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


module PCAdder_tb();

    reg [63:0] pc_out;
    wire [63:0] adder_out;
    
    PCAdder uut(
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
