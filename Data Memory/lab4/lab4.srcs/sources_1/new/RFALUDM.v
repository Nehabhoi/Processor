`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 09.10.2020 16:04:28
// Design Name: 
// Module Name: RFALUDM
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


module RFALUDM(
    clk,
    reset,
    wr_en,
    memToReg,
    mem_rd,
    mem_wr,
    ALU_src,
    DM_store,
    wr_addr,
    wr_data,
    rd_addr_1,
    rd_addr_2,
    displacement,
    ALU_op,
    Opcode_field
    );
    
    input clk;
    input reset;
    input wr_en;
    input memToReg;
    input mem_rd;
    input mem_wr;
    input ALU_src;
    input DM_store;
    input [4:0] wr_addr;
    input [63:0] wr_data;
    input [4:0] rd_addr_1;
    input [4:0] rd_addr_2;
    input [8:0] displacement;
    input [1:0] ALU_op;
    input [10:0] Opcode_field;
    
    wire [63:0] selected_data;
    wire [63:0] rd_data_out_1;
    wire [63:0] rd_data_out_2;
    wire [63:0] ALUInput_B;
    wire [63:0] ALU_result;
    wire Zero;
    wire [63:0] wr_data_bus;
    wire [63:0] rd_data_bus;
    wire [63:0] signExtended_displacement;
    
    regfile regFileUnit(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_addr_1(rd_addr_1),
    .rd_addr_2(rd_addr_2),
    .wr_addr(wr_addr),
    .d_in(selected_data),
    .d_out_1(rd_data_out_1),
    .d_out_2(rd_data_out_2)
    );
    
    LEGv8ALUwithControl ALUUnit(
    .ALUOp(ALU_op),
    .Opcode_field(Opcode_field),
    .A(rd_data_out_1),
    .B(ALUInput_B),
    .ALU_result(ALU_result), 
    .Zero(Zero));
    
    DataMem DataMemUnit(
    .clk(clk),
    .mem_wr(mem_wr),
    .mem_rd(mem_rd),
    .addr(ALU_result[7:0]),
    .wr_data(wr_data_bus),
    .rd_data(rd_data_bus)
    );
    
    mux2to1 RF_WriteData_MUXUnit(
    .data_in_0(rd_data_bus),
    .data_in_1(ALU_result),
    .selection(memToReg),
    .data_out(selected_data)
    );
    
    mux2to1 ALU_Source_MUXUnit(
    .data_in_0(signExtended_displacement),
    .data_in_1(rd_data_out_2),
    .selection(ALU_src),
    .data_out(ALUInput_B)
    );
    
    mux2to1 DM_store_MUXUnit(
    .data_in_0(rd_data_out_2),
    .data_in_1(wr_data),
    .selection(DM_store),
    .data_out(wr_data_bus)
    );
    
    signExtend signExtentedUnit(
    .offset(displacement),
    .signExtend_offset(signExtended_displacement)
    );
endmodule
