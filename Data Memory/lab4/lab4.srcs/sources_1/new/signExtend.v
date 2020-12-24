`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 09.10.2020 14:45:53
// Design Name: 
// Module Name: signExtend
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


module signExtend(
    offset,
    signExtend_offset
    );
    
    input [8:0] offset;
    output reg [63:0] signExtend_offset;
    
    always@(offset)
        signExtend_offset <= {{55{offset[8]}}, offset[8:0]};
    begin
    end
endmodule
