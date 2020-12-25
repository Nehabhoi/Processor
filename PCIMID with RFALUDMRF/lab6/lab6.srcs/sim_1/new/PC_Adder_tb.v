`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 27.10.2020 13:42:33
// Design Name: 
// Module Name: PC_Adder_tb
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


module PC_Adder_tb();
    reg clk;
    reg reset;
    wire [63:0] pc_out;
    
    PC_Adder uut(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
    );
    
    always @(posedge clk)
        begin
            #10
            clk = ~clk;
        end
        
    always @(negedge clk)
        begin
            #90
            clk = ~clk;
        end
    initial
        begin
        clk=0;                
        reset=1;    
        #100 reset=0;
        end
endmodule
