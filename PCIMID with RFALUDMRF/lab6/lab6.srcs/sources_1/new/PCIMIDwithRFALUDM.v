`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Neha Bhoi
// 
// Create Date: 27.10.2020 12:08:43
// Design Name: 
// Module Name: PCIMIDwithRFALUDM
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


module PCIMIDwithRFALUDM(
    reset,
    clk
    );
    
    input reset;
    input clk;
    wire [63:0] pc_out;
    
    wire [7:0] ReadAddress;
    wire [31:0] Instruction;
    
    wire RegWrite;
    wire [4:0] ReadRegister1;
    wire [4:0] ReadRegister2;
    wire [4:0] WriteRegister;
    wire [63:0] WriteData_RF;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    wire Reg2Loc;
    
    wire [4:0] IMRF_input0;
    wire [4:0] IMRF_input1;
    
    wire [63:0] RFALU_input1;
    wire [63:0] ALU_Src;
    wire ALUSrc;
    
    wire [1:0] ALUOp;
    wire [10:0] ALU_opcode;
    wire [3:0] ALU_ctrl_out;
    
    wire [63:0] ALUResult;
    wire Zero;
    
    wire [7:0] DM_addr;
    wire [63:0] ReadData_DM;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire Branch;
    
    // program counter with Adder unit
    PC_Adder ProgramCounter_Unit(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
    );
    
    // instruction memory unit
    IM InstructionMemory_Unit(
    .mem_pc(ReadAddress),
    .instruction_out(Instruction)
    );
    
    // register file unit
    regfile RegisterFile_Unit(
    .clk(clk),
    .reset(reset),
    .wr_en(RegWrite),
    .rd_addr_1(ReadRegister1),
    .rd_addr_2(ReadRegister2),
    .wr_addr(WriteRegister),
    .d_in(WriteData_RF),
    .d_out_1(ReadData1),
    .d_out_2(ReadData2)
    );
    
    // instruction memory to register file MUX unit
    mux2to1_5bit IMToRFMux_Unit(
    .In0(IMRF_input0),
    .In1(IMRF_input1),
    .Sel(Reg2Loc),
    .Out(ReadRegister2)
    );
    
    // sign Extend Unit
    signExtend signExtend_Unit(
    .offset(Instruction[20:12]),
    .signExtend_offset(RFALU_input1)
    );
    
    // register file to ALU MUX unit
    mux2to1 RFTOALUMux_Unit(
    .data_in_0(ReadData2),
    .data_in_1(RFALU_input1),
    .selection(ALUSrc),
    .data_out(ALU_Src)
    );
    
    // ALU Control unit
    LEGv8ALU_control ALU_Control_Unit(
    .ALU_operation(ALU_ctrl_out),
    .Opcode_field(ALU_opcode),
    .ALU_op(ALUOp)
    );
    
    // ALU Unit
    LEGv8ALU ALU_Unit(
    .ALU_operation(ALU_ctrl_out),
    .A(ReadData1),
    .B(ALU_Src),
    .ALU_result(ALUResult),
    .Zero(Zero)
    );
    
    // data memory Unit
    DataMem DataMemory_Unit(
    .clk(clk),
    .mem_wr(MemWrite),
    .mem_rd(MemRead),
    .addr(DM_addr),
    .wr_data(ReadData2),
    .rd_data(ReadData_DM)
    );
    
    // Data memory to Register file MUX unit
    mux2to1 DMToRFMUX_Unit(
    .data_in_0(ALUResult),
    .data_in_1(ReadData_DM),
    .selection(MemtoReg),
    .data_out(WriteData_RF)
    );
    
    // instruction decoder unit
    ID InstructionDecoder_Unit(
    .Opcode(ALU_opcode),
    .Reg2Loc(Reg2Loc),
    .ALUSrc(ALUSrc),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUOp(ALUOp)
    );
    
    assign ReadAddress = pc_out[7:0];
    assign ReadRegister1 = Instruction[9:5];
    assign WriteRegister = Instruction[4:0];
    assign IMRF_input0 = Instruction[20:16];
    assign IMRF_input1 = Instruction[4:0];
    assign ALU_opcode = Instruction[31:21];
    assign DM_addr = ALUResult[7:0];
endmodule
