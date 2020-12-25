`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 19.10.2020 01:28:26
// Design Name: 
// Module Name: IM
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


module IM(
    input [63:0] mem_pc,
    output reg [31:0] instruction_out
    );
    
    reg[8:0] im[63:0];
    
    initial
    begin
        //load operations
        //load register 5 from location 40: instruction- 11111000;010_00010;1000_00_00;000_00101
        im[0]=8'h05;
        im[1]=8'h80;
        im[2]=8'h42;
        im[3]=8'hf8;
        
        //load register 10 from location 80: instruction- 11111000;010_00101;0001_00_00;000_01010
        im[4]=8'h0A;
        im[5]=8'h10;
        im[6]=8'h45;
        im[7]=8'hf8;
        
        //4 ALU Operations
        //ADD X1, X5, X10: instruction- 10001011;000_01010_;000000_00;101_00001
        im[8]=8'hA1;
        im[9]=8'h00;
        im[10]=8'h0A;
        im[11]=8'h8B;
        
        //AND X2, X5, X10: instruction- 10001010;000_01010_;000000_00;101_00010
        im[12]=8'hA2;
        im[13]=8'h00;
        im[14]=8'h0A;
        im[15]=8'h8A;
        
        //OR X3, X5, X10: instruction- 10101010;000_01010_;000000_00;101_00011
        im[16]=8'hA3;
        im[17]=8'h00;
        im[18]=8'h0A;
        im[19]=8'hAA;
                        
        //SUB X4, X5, X10: instruction- 11001011;000_01010_;000000_00;101_00100
        im[20]=8'hA4;
        im[21]=8'h00;
        im[22]=8'h0A;
        im[23]=8'hCB;
        
        //Store Operations
                
        //STUR X1,[X0,#8]: instruction-;11111000;000_00000;1000_00_00;000_00001
        im[24]=8'h01;
        im[25]=8'h80;
        im[26]=8'h00;
        im[27]=8'hF8;
                        
        //STUR X2,[X0,#16]: instruction- 11111000;000_00001;0000_00_00;000_00010
        im[28]=8'h02;
        im[29]=8'h00;
        im[30]=8'h01;
        im[31]=8'hF8;
                  
        //STUR X3,[X0,#24]: instruction- 11111000;000_00001;1000_00_00;000_00011
        im[32]=8'h03;
        im[33]=8'h80;
        im[34]=8'h01;
        im[35]=8'hF8;
                        
        //STUR X4,[X0,#32]: instruction- 11111000;000_00010;0000_00_00;000_00100        
        im[36]=8'h04;
        im[37]=8'h00;
        im[38]=8'h02;
        im[39]=8'hF8;
    end
    
    always@(mem_pc)
    begin
        instruction_out[31:24] = im[mem_pc+3];
        instruction_out[23:16] = im[mem_pc+2];
        instruction_out[15:8] = im[mem_pc+1];
        instruction_out[7:0] = im[mem_pc];
    end
endmodule
