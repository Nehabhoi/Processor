`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 21.09.2020 15:29:32
// Design Name: 
// Module Name: regfile
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


module regfile(
    clk,
    reset,
    wr_en,
    rd_addr_1,
    rd_addr_2,
    wr_addr,
    d_in,
    d_out_1,
    d_out_2
    );
    
    input clk;
    input reset;
    input wr_en;
    input [4:0] rd_addr_1;
    input [4:0] rd_addr_2;
    input [4:0] wr_addr;
    input [63:0] d_in;
    output reg [63:0] d_out_1;
    output reg [63:0] d_out_2;
    
    reg [63:0] RF[0:31];
    integer i; 
     always @(posedge clk or negedge clk)
     begin
       // check if write is enabled
        if(wr_en == 1)
        begin
            if(clk == 1)
            begin 
                if(reset)
                begin
                for (i = 0; i < 32; i = i + 1) 
                    begin
                    RF [i] = 32'h0; 
                    end 
                end
                else if(clk == 1)
                begin
                    RF[wr_addr] <= d_in;
                end 
            end
        end
        else
        begin
         // save data stored at rd_addr_1 into d_out_1     
         d_out_1 = RF[rd_addr_1];
         
         // save data stored at rd_addr_2 into d_out_2
         d_out_2 = RF[rd_addr_2];
         
         end
    end  
    
endmodule
