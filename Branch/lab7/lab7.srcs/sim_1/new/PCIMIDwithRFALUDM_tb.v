`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 16:45:47
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
    #5 
    clk = ~clk; 
    end
    
    always @(negedge clk)
    begin 
    #20
    clk = ~ clk;
    end
    
    initial
    begin
        $readmemh("IMData.mem", uut.InstructionMemory_Unit.IMreg);
        $readmemh("DMData.mem", uut.DataMemory_Unit.RF );
        reset = 1; clk = 0;
        #25 reset = 0;
    end
endmodule
