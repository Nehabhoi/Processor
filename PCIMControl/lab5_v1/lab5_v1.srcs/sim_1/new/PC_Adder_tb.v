`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 19.10.2020 00:38:36
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
    reg [63:0] pc_in;
    wire [63:0] pc_out;
    wire [63:0] adder_out;
    
    PC_Adder uut(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .pc_out(pc_out),
    .adder_out(adder_out)
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
