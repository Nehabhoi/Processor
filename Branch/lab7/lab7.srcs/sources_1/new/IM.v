`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 13:25:52
// Design Name: 
// Module Name: IM
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


module IM(
    mem_pc,
    instruction_out
    );
    
    input [7:0] mem_pc;
    output reg [31:0] instruction_out;
    
    reg [7:0] IMreg [0:255]; 
    always@(mem_pc)
    begin
        instruction_out <= {IMreg[mem_pc + 3], IMreg[mem_pc + 2], IMreg[mem_pc + 1], IMreg[mem_pc + 0]};
    end
endmodule
