`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 27.10.2020 16:24:41
// Design Name: 
// Module Name: PCIMIDwithRFALUDM_tb
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


module PCIMIDwithRFALUDM_tb();
    
    reg reset;
    reg clk;
    
    PCIMIDwithRFALUDM uut(
    .reset(reset),
    .clk(clk)
    );
    
    always @(posedge clk)
    begin 
    #10 
    clk = ~clk; 
    end
    
    always @(negedge clk)
    begin 
    #40
    clk = ~ clk;
    end
    
    initial
    begin
        $readmemh("IMData.mem", uut.InstructionMemory_Unit.IMreg);
        $readmemh("DMData.mem", uut.DataMemory_Unit.RF );
        reset = 1; clk = 0;
        #50 reset = 0;
    end
endmodule
