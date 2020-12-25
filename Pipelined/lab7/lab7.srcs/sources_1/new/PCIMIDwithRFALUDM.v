`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: Neha Bhoi
// 
// Create Date: 16.11.2020 12:34:24
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
    clk,
    reset
    );
    
    input clk;
    input reset;
    
    wire [63:0] pc_in;
    wire [63:0] pc_out;
    
    wire [63:0] PCOut;
    
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
    
    wire [63:0] BranchAdder_input1;
    wire [63:0] BranchMux_input1;
    
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
    
    wire ANDResult;
    
    wire [31:0]Instruction_IFID;
    wire [63:0]PCOut_IFID;    
    
    wire  IDEX_ALUSrc, IDEX_MemtoReg, IDEX_RegWrite, IDEX_MemRead, IDEX_MemWrite, IDEX_Branch;
    wire [1:0] IDEX_ALUOp;
    wire [63:0] IDEX_PC;
    wire [63:0] IDEX_ReadData1;
    wire [63:0] IDEX_ReadData2;
    wire [63:0] IDEX_SE;
    wire [10:0] IDEX_opcode;
    wire [4:0] IDEX_WriteRegister;
    
    wire  EXMEM_MemtoReg, EXMEM_RegWrite, EXMEM_MemRead, EXMEM_MemWrite, EXMEM_Branch;
    wire [63:0] EXMEM_ReadData2;
    wire [4:0] EXMEM_WriteRegister;
    wire [63:0] EXMEM_BranchMux_input1;
    wire [63:0] EXMEM_ALUResult;
    wire EXMEM_Zero;
    
    wire  MEMWB_MemtoReg, MEMWB_RegWrite;
     wire [4:0] MEMWB_WriteRegister; 
     wire [63:0] MEMWB_ALUResult;
     wire [63:0] MEMWB_ReadData_DM;
    
    //Program Counter Unit
    PC ProgramCounter_Unit(
    .clk(clk),
    .reset(reset),
    .pc_in(pc_in),
    .pc_out(pc_out)
    );
    
    //Adder for Program Counter Unit
    PCAdder PCAdder_Unit(
    .pc_out(pc_out),
    .adder_out(PCOut)
    );
    
    // instruction memory unit
    IM InstructionMemory_Unit(
    .mem_pc(ReadAddress),
    .instruction_out(Instruction)
    );
    
    // IF-ID pipilene register unit
    IFID_Reg IFID_Register_Unit(
    .clk(clk), 
    .PCOut(pc_out), 
    .Instruction(Instruction), 
    .Instruction_IFID(Instruction_IFID), 
    .PCOut_IFID(PCOut_IFID)
    );
    
    // register file unit
    regfile RegisterFile_Unit(
    .clk(clk),
    .reset(reset),
    .wr_en(MEMWB_RegWrite),
    .rd_addr_1(ReadRegister1),
    .rd_addr_2(ReadRegister2),
    .wr_addr(MEMWB_WriteRegister),
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
    .offset(Instruction_IFID),
    .signExtend_offset(RFALU_input1)
    );
    
    // BranchAdder Unit
    BranchAdder BranchAdder_Unit(
    .PC(IDEX_PC),
    .BranchAdd(BranchAdder_input1),
    .TargetAdd(BranchMux_input1)
    );
    
    //ShiftLeft2 Unit
    ShiftLeft2 ShiftLeft2_Unit(
    .inputData(IDEX_SE),
    .outputData(BranchAdder_input1)
    );
    
    //Branch Mux Unit
    mux2to1 BranchMux_Unit(
    .data_in_0(PCOut),
    .data_in_1(EXMEM_BranchMux_input1),
    .selection(ANDResult),
    .data_out(pc_in)
    );
    
     // register file to ALU MUX unit
    mux2to1 RFTOALUMux_Unit(
    .data_in_0(IDEX_ReadData2),
    .data_in_1(IDEX_SE),
    .selection(IDEX_ALUSrc),
    .data_out(ALU_Src)
    );
    
     // ALU Control unit
    LEGv8ALU_control ALU_Control_Unit(
    .ALU_operation(ALU_ctrl_out),
    .Opcode_field(IDEX_opcode),
    .ALU_op(IDEX_ALUOp)
    );
    
    // ALU Unit
    LEGv8ALU ALU_Unit(
    .ALU_operation(ALU_ctrl_out),
    .A(IDEX_ReadData1),
    .B(ALU_Src),
    .ALU_result(ALUResult),
    .Zero(Zero)
    );
    
    
    //EX-MEM pipline Residter Unit 
    EXMEM_reg EXMEM_Reg_Unit(
    .clk(clk),
    .reset(reset),  
    .MemRead_in(IDEX_MemRead), 
    .MemWrite_in(IDEX_MemWrite),  
    .RegWrite_in(IDEX_RegWrite), 
    .MemtoReg_in(IDEX_MemtoReg), 
    .Branch_in(IDEX_Branch), 
    .BranchAdder_in(BranchMux_input1), 
    .ALUResult_in(ALUResult), 
    .ALUZero_in(Zero), 
    .ReadData2_in(IDEX_ReadData2), 
    .WriteAdd_in(IDEX_WriteRegister), 
    .MemRead_out(EXMEM_MemRead), 
    .MemWrite_out(EXMEM_MemWrite),  
    .RegWrite_out(EXMEM_RegWrite), 
    .MemtoReg_out(EXMEM_MemtoReg), 
    .Branch_out(EXMEM_Branch),
    .BranchAdder_out(EXMEM_BranchMux_input1), 
    .ALUResult_out(EXMEM_ALUResult), 
    .ALUZero_out(EXMEM_Zero), 
    .ReadData2_out(EXMEM_ReadData2), 
    .WriteAdd_out(EXMEM_WriteRegister)
    );
    
    // data memory Unit
    DataMem DataMemory_Unit(
    .clk(clk),
    .mem_wr(EXMEM_MemWrite),
    .mem_rd(EXMEM_MemRead),
    .addr(DM_addr),
    .wr_data(EXMEM_ReadData2),
    .rd_data(ReadData_DM)
    );
    
    MEMWB_Reg MEMWB_Register_Unit(
    .clk(clk), 
    .MemtoReg_in(EXMEM_MemtoReg), 
    .RegWrite_in(EXMEM_RegWrite), 
    .ReadData_in(ReadData_DM), 
    .ALUResult_in(EXMEM_ALUResult), 
    .WriteAdd_in(EXMEM_WriteRegister), 
    .MemtoReg_out(MEMWB_MemtoReg), 
    .RegWrite_out(MEMWB_RegWrite), 
    .ReadData_out(MEMWB_ReadData_DM), 
    .ALUResult_out(MEMWB_ALUResult), 
    .WriteAdd_out(MEMWB_WriteRegister)
    );
    
    // Data memory to Register file MUX unit
    mux2to1 DMToRFMUX_Unit(
    .data_in_0(MEMWB_ALUResult),
    .data_in_1(MEMWB_ReadData_DM),
    .selection(MEMWB_MemtoReg),
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
    
    //ID-EX pipline register unit
    IDEX_Reg IDEX_REg_Unit(
    .clk(clk), 
    .ALUSrc_in(ALUSrc),
    .MemtoReg_in(MemtoReg),
    .RegWrite_in(RegWrite),
    .MemRead_in(MemRead),
    .MemWrite_in(MemWrite),
    .Branch_in(Branch), 
    .ALUOp_in(ALUOp),
    .ALUSrc_out(IDEX_ALUSrc),
    .MemtoReg_out(IDEX_MemtoReg),
    .RegWrite_out(IDEX_RegWrite),
    .MemRead_out(IDEX_MemRead),
    .MemWrite_out(IDEX_MemWrite),
    .Branch_out(IDEX_Branch), 
    .ALUOp_out(IDEX_ALUOp),
    .PC_in(PCOut_IFID), 
    .PC_out(IDEX_PC), 
    .ReadData1_in(ReadData1), 
    .ReadData1_out(IDEX_ReadData1), 
    .ReadData2_in(ReadData2), 
    .ReadData2_out(IDEX_ReadData2), 
    .SE_in(RFALU_input1), 
    .SE_out(IDEX_SE),
    .opcode_in(ALU_opcode), 
    .opcode_out(IDEX_opcode), 
    .writeadd_in(WriteRegister), 
    .writeadd_out(IDEX_WriteRegister)
    );
    
    assign ReadAddress = pc_out[7:0];
    assign ReadRegister1 = Instruction_IFID[9:5];
    assign WriteRegister = Instruction_IFID[4:0];
    assign IMRF_input0 = Instruction_IFID[20:16]; 
    assign IMRF_input1 = Instruction_IFID[4:0]; 
    assign ALU_opcode = Instruction_IFID[31:21];
    assign DM_addr = EXMEM_ALUResult[7:0];
    assign ANDResult = EXMEM_Zero & EXMEM_Branch;
endmodule
