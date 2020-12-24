`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 09.10.2020 18:58:52
// Design Name: 
// Module Name: RFALUDM_tb
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


module RFALUDM_tb();
    //Input
    reg clk;
    reg reset;
    reg wr_en;
    reg memToReg;
    reg mem_rd;
    reg mem_wr;
    reg ALU_src;
    reg DM_store;
    reg [4:0] wr_addr;
    reg [63:0] wr_data;
    reg [4:0] rd_addr_1;
    reg [4:0] rd_addr_2;
    reg [8:0] displacement;
    reg [1:0] ALU_op;
    reg [10:0] Opcode_field;
    
    RFALUDM uut(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .memToReg(memToReg),
    .mem_rd(mem_rd),
    .mem_wr(mem_wr),
    .ALU_src(ALU_src),
    .DM_store(DM_store),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd_addr_1(rd_addr_1),
    .rd_addr_2(rd_addr_2),
    .displacement(displacement),
    .ALU_op(ALU_op),
    .Opcode_field(Opcode_field)
    );
    
    //initializing clock
     always 
        begin 
        #5 
        clk = ~ clk; 
        end
    
    initial
    begin
         //Initialize register file and data memory unit
         clk = 0; reset = 1; memToReg = 0; mem_wr = 1; wr_en = 1;
         $readmemh("INIT.mem", uut.DataMemUnit.RF);
         
         //testbench :Load register from memory and perform ALU operation on it and store reult back to register
         
         #10
         //Calculate the effective address hex 50 read data from memory store that data back to register file in register 10
         mem_wr = 0; mem_rd = 1; wr_en = 1;
         ALU_src = 0; 
         displacement = 9'b001010000;
         Opcode_field = 11'b10001011000; ALU_op = 2'b10;
         #20
         reset = 0;
         wr_en = 0;
         rd_addr_1 = 5'b00000;
         rd_addr_2 = 5'b00001;
         
         #5
         wr_addr = 5'b01010;
         wr_en = 1;
         
         //Calculate the effective address hex 28 read data from memory store that data back to register file in register 5
         #10
         mem_wr = 0; 
         ALU_src = 0; 
         displacement = 9'b000101000;
         Opcode_field = 11'b10001011000; ALU_op = 2'b10;
         #10 mem_rd = 1; wr_en = 1;
         wr_addr = 5'b00101;
         
         //perform Addition on register 5 and 10 store result back to register 1
         #5
         wr_en = 0; 
         rd_addr_1 = 5'b00101;
         rd_addr_2 = 5'b01010; 
         ALU_src = 1; 
         ALU_op = 2'b10; 
         Opcode_field = 11'b10001011000;  
         #5 
         wr_addr = 5'b000001; 
         memToReg = 1;
         wr_en = 1;
         
         #15
        //perform subtraction on register 5 and 10 store result back to register 2
         memToReg = 0;
         wr_en = 0; 
         rd_addr_1 = 5'b00101;
         rd_addr_2 = 5'b01010; 
         ALU_src = 1; 
         ALU_op = 2'b10; 
         Opcode_field = 11'b11001011000;
         #5 
         wr_addr = 5'b00010; 
         memToReg = 1;
         wr_en = 1;
         
         
         #15
        //perform or on register 5 and 10 store result back to register 3
         memToReg = 0;
         wr_en = 0; 
         rd_addr_1 = 5'b00101;
         rd_addr_2 = 5'b01010; 
         ALU_src = 1; 
         ALU_op = 2'b10; 
         Opcode_field = 11'b10101010000;
         #5 
         wr_addr = 5'b00011; 
         memToReg = 1;
         wr_en = 1;
         
         #15
        //perform and on register 5 and 10 store result back to register 4
         memToReg = 0;
         wr_en = 0; 
         rd_addr_1 = 5'b00101;
         rd_addr_2 = 5'b01010; 
         ALU_src = 1; 
         ALU_op = 2'b10; 
         Opcode_field = 11'b10001010000; 
         #5 
         wr_addr = 5'b00100; 
         memToReg = 1;
         wr_en = 1;
         
         
         //testbench: Store register back to memory
         //R1 store to DM[8] to DM[15]
         #15
         mem_wr = 1; 
         mem_rd = 0; 
         wr_en = 0; 
         rd_addr_1 = 5'b00000; 
         rd_addr_2 = 5'b00001;
         Opcode_field = 11'b10001011000; 
         ALU_op = 2'b10;
         ALU_src = 0; 
         displacement = 9'b000001000;  
         #5
         DM_store = 0;
         
         //R2 store to DM[16] to DM[13]
         #15
         mem_wr = 1; 
         mem_rd = 0; 
         wr_en = 0; 
         rd_addr_1 = 5'b00000; 
         rd_addr_2 = 5'b00010;
         Opcode_field = 11'b10001011000; 
         ALU_op = 2'b10;
         ALU_src = 0; 
         displacement = 9'b000010000;  
         #5
         DM_store = 0;
         
         //R3 store to DM[24] to DM[32]
         #15
         mem_wr = 1; 
         mem_rd = 0; 
         wr_en = 0; 
         rd_addr_1 = 5'b00000; 
         rd_addr_2 = 5'b00011;
         Opcode_field = 11'b10001011000; 
         ALU_op = 2'b10;
         ALU_src = 0; 
         displacement = 9'b000011000;  
         #5
         DM_store = 0;
         
         //R4 store to DM[31] to DM[39]
          #15
         mem_wr = 1; 
         mem_rd = 0; 
         wr_en = 0; 
         rd_addr_1 = 5'b00000; 
         rd_addr_2 = 5'b00100;
         Opcode_field = 11'b10001011000; 
         ALU_op = 2'b10;
         ALU_src = 0; 
         displacement = 9'b000100000;  
         #5
         DM_store = 0;
         
                   
          
         
    end
endmodule
