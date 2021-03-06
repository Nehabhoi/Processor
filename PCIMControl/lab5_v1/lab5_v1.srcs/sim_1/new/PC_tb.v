`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 18.10.2020 19:02:40
// Design Name: 
// Module Name: PC_tb
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


module PC_tb();
    reg clk;
    reg reset;
    reg [63:0] pc_in;
    wire [63:0] pc_out;
    
    PC uut(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .pc_out(pc_out)
    );
    
    always @(posedge clk)
        begin
            #10 clk = ~clk;
        end
    
    always @(negedge clk)
        begin    
            #90 clk = ~clk;
        end
       
    initial
    begin
        clk = 0;
        pc_in = 0;
        reset = 1;
        
        #100
        reset=0; 
        pc_in=64'haaaaaaaaaaaaaaaa;
        
        #100
        pc_in=64'h5555555555555555;
        
        
    end
endmodule
