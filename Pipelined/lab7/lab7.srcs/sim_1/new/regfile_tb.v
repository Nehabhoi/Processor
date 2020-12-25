`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 13:46:27
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb();

    //Input
    reg clk;
    reg reset;
    reg wr_en;
    reg [4:0] rd_addr_1;
    reg [4:0] rd_addr_2;
    reg [4:0] wr_addr;
    reg [63:0] d_in;
    
    //Output
    wire [63:0] d_out_1;
    wire [63:0] d_out_2;
    
    //Initiate th module
    regfile uut(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_addr_1(rd_addr_1),
    .rd_addr_2(rd_addr_2),
    .wr_addr(wr_addr),
    .d_in(d_in),
    .d_out_1(d_out_1),
    .d_out_2(d_out_2)
    );
    initial
    begin
    
    // reset
    clk = 0;
    reset = 1;
    wr_en = 1;
    
    #50
    clk = 1;
    
    //read register 5 and 10 and check if the register are reset
    #50
    wr_en = 0;
    rd_addr_1 = 5'b00101;
    rd_addr_2 = 5'b01010;
    clk = 0;
    
    //write to register 5 
    #50
    wr_en = 1;
    reset = 0;
    wr_addr = 5'b00101;
    d_in = 64'h5555555555555555;
    clk = 1;
    
    //read register 5 and check if the register is reading correct value in rd_addr_1
    #50
    wr_en = 0;
    rd_addr_1 = 5'b00101;
    clk = 0;
    
    //write to register 10 
    #50
    wr_en = 1;
    reset = 0;
    wr_addr = 5'b01010;
    d_in = 64'haaaaaaaaaaaaaaaa;
    clk = 1;
    
    //read register 10 and check if the register is reading correct value in rd_addr_2
    #50
    wr_en = 0;
    rd_addr_2 = 5'b01010;
    clk = 0;
    
    //write to register 9 
    #50
    wr_en = 1;
    reset = 0;
    wr_addr = 5'b01001;
    d_in = 64'h1111111111111111;
    clk = 1;
    
    //read register 9 and check if the register is reading correct value in rd_addr_1
    #50
    wr_en = 0;
    rd_addr_1 = 5'b01001;
    clk = 0;
    
    //write to register 12 
    #50
    wr_en = 1;
    reset = 0;
    wr_addr = 5'b01100;
    d_in = 64'h7777777777777777;
    clk = 1;
    
    //read register 12 and check if the register is reading correct value in rd_addr_2
    #50
    wr_en = 0;
    rd_addr_2 = 5'b01100;
    clk = 0;
    
    end
endmodule
