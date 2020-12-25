`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 16:27:02
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    clk,
    mem_wr,
    mem_rd,
    addr,
    wr_data,
    rd_data
    );
    
    input clk;
    input mem_wr;
    input mem_rd;
    input [7:0] addr;
    input [63:0] wr_data;
    output reg [63:0] rd_data;
    reg [7:0] RF[255:0];
    
    always@(posedge clk)
        begin
            if(mem_wr==1)
                begin
                    RF[addr]   = wr_data[63:56];
                    RF[addr+1] = wr_data[55:48];
                    RF[addr+2] = wr_data[47:40];
                    RF[addr+3] = wr_data[39:32];
                    RF[addr+4] = wr_data[31:24];
                    RF[addr+5] = wr_data[23:16];
                    RF[addr+6] = wr_data[15:8];
                    RF[addr+7] = wr_data[7:0];
                end
        end
        
    always@(mem_rd, addr)
        begin
            if(mem_rd == 1)
            begin
                rd_data <= {RF[addr + 0], RF[addr + 1], RF[addr + 2], RF[addr + 3], RF[addr + 4], RF[addr + 5], RF[addr + 6], RF[addr + 7]};
            end
            else
            begin
                rd_data <= 64'hz;
            
            end
        end
endmodule
