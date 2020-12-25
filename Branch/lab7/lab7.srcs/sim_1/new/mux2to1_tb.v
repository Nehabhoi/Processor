`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 15:34:45
// Design Name: 
// Module Name: mux2to1_tb
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


module mux2to1_tb();

    //Input
    reg [63:0] data_in_0;
    reg [63:0] data_in_1;
    reg selection;
    
    //Output
    wire [63:0] data_out;
    
    mux2to1 uut(
    .data_in_0(data_in_0),
    .data_in_1(data_in_1),
    .selection(selection),
    .data_out(data_out)
    );
    
    initial
    begin
        data_in_0 = 64'h0000000000000000;
        data_in_1 = 64'h5555555555555555;
        
        #100;
        selection = 0;
        
        #100
        selection = 1;
        
        
    end
endmodule
