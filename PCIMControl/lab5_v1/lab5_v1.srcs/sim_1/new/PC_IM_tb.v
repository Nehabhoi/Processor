`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 530 - Fall 2020
// Engineer: Neha Bhoi
// 
// Create Date: 19.10.2020 01:54:15
// Design Name: 
// Module Name: PC_IM_tb
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


module PC_IM_tb();

    reg clk;
    reg reset;
    reg [63:0] pc_in;
    wire[63:0]pc_out;
    wire [63:0] adder_out;
    wire [31:0]instruction_out;
    
    PC_IM uut(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .pc_out(pc_out),
    .adder_out(adder_out),
    .instruction_out(instruction_out)
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
        pc_in=0;
        #100 reset=0;                        
    end 
endmodule
