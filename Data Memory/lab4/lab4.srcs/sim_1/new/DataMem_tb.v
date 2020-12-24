`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 09.10.2020 11:54:56
// Design Name: 
// Module Name: DataMem_tb
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


module DataMem_tb();

    //Input
    reg clk;
    reg mem_wr;
    reg mem_rd;
    reg [7:0] addr;
    reg [63:0] wr_data;
    
    //Output
    wire [63:0] rd_data;
    
    //Initialize module
    DataMem uut(
    .clk(clk),
    .mem_wr(mem_wr),
    .mem_rd(mem_rd),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data)
    );
    
    always begin #5 clk = ~ clk; end
     
     initial begin 
     clk = 0; mem_wr = 1;
     
     //Location 0 with all zeros,
     #10 addr = 8'b00000000; wr_data = 64'h0000000000000000;
     
     //Location 40 decimal (28 in hex) with all 5s 
     #10 addr = 8'b00101000; wr_data = 64'h5555555555555555;
     
     // Location 80 (50 in hex) with all 'a's
     #10 addr = 8'b01010000; wr_data = 64'haaaaaaaaaaaaaaaa;
     
     //Test read
     #20 mem_wr = 0; mem_rd = 1;
     //Read location 40 decimal (28 in hex) with all 5s 
     #10 addr =  8'b00101000;
     
     //Read location 80 (50 in hex) with all 'a's
     #10 addr = 8'b01010000;
     
     // address as 40 and Memory Write data as 64'haaaaaaaaaaaaaaaa 
     #10
     mem_wr = 1;
     mem_rd = 0;
     addr =  8'b00101000;
     wr_data = 64'haaaaaaaaaaaaaaaa;
     
     #10 mem_rd = 1; 
     
     end 
endmodule
