`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 14:39:46
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
    
    input [31:0] offset;
    output reg [63:0] signExtend_offset;
    
    always@(offset)
    begin
        //B type instruction
        if (offset[31:26] == 6'b000101) 
        begin
            signExtend_offset[25:0] = offset[25:0];
            signExtend_offset <= {{38{signExtend_offset[25]}}, signExtend_offset[25:0]};
        end
        else if (offset[31:24] == 8'b10110100)  //CB type instruction
        begin
            signExtend_offset[19:0] = offset[23:5];
            signExtend_offset <= {{44{signExtend_offset[19]}}, signExtend_offset[19:0]};
        end
        else
        begin //D type instruction
             signExtend_offset[9:0] = offset[20:12];
             signExtend_offset <= {{54{signExtend_offset[9]}}, signExtend_offset[9:0]};
        end
    end
endmodule
