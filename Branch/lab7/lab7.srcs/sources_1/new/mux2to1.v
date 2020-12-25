`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 15:33:45
// Design Name: 
// Module Name: mux2to1
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


module mux2to1(
    data_in_0,
    data_in_1,
    selection,
    data_out
    );
    
    input [63:0] data_in_0;
    input [63:0] data_in_1;
    input selection;
    output reg [63:0] data_out;
    
    always @(data_in_0, data_in_1, selection)
    begin
        if(selection == 0)
        begin
            data_out = data_in_0;
        end
        else if(selection == 1)
        begin
            data_out = data_in_1;
        end    
    end
endmodule
