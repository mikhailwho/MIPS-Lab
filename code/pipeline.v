`include "definitions.vh"

module pipeline;

// size of data and instruction memory
    parameter MEMSIZE=1024;

//special
    wire clk,clk_a;
    reg reset,run;

// wires from Fetch outputs

    wire [`WORD-1:0] nPC_IFID;
    wire [`WORD-1:0] IR_IFID;

// wires from decode outputs

    wire [`WORD-1:0] nPCout_IDEX;
    wire [`WORD-1:0] A_IDEX;
    wire [`WORD-1:0] B_IDEX;
    wire [`WORD-1:0] SE_IDEX;
    wire [4:0] RT_IDEX;
    wire [4:0] RD_IDEX;
    wire [1:0] ALUOp_IDEX;
    wire ALUSrc_IDEX;
    wire Branch_IDEX;
    wire MemRead_IDEX;
    wire MemWrite_IDEX;
    wire MemtoReg_IDEX;
    wire RegWrite_IDEX;
    wire RegDst_IDEX;

// wires from Execute outputs

    wire [`WORD-1:0] Branch_Target_EXMEM;
    wire [`WORD-1:0] Result_EXMEM;
    wire [`WORD-1:0] MemWriteData_EXMEM;
    wire [4:0] RegDstAddress_EXMEM;
    wire zero_EXMEM;
    wire Branch_out_EXMEM;
    wire MemRead_out_EX;
    wire MemWrite_out_EXMEM;
    wire RegWrite_out_EXMEM;
    wire MemtoReg_out_EXMEM;

// wires from Memory outputs

    wire RegWrite_out_MEMWB;
    wire MemtoReg_out_MEMWB;
    wire PCSrc_MEM;
    wire [4:0] RegDstAddress_out_MEM;
    wire [`WORD-1:0] MemReadData_MEMWB;
    wire [`WORD-1:0] ALUResult_out_MEMWB;

// wires from Write Back outputs
 
    wire [`WORD-1:0] result;


// clock generator
oscillator  Crystal(
    .clk(clk)
    );

// does run control and slips - use clk_a not clk
assign clk_a = clk & run;

// Fetch

iFetch fetch(
        //IN
        .clk(clk_a),
        .reset(reset),
        .PCSrc(PCSrc_MEM),
        .BrDest(Branch_Target_EXMEM),
         //OUT
        .nPC(nPC_IFID),
        .IR(IR_IFID)
    );

// Decode
 iDecode decode(
          //IN
        .clk(clk_a),
        .reset(reset),
        .nPC(nPC_IFID),
        .IR(IR_IFID),
        .Result(result), 
        .WriteAddress(RegDstAddress_out_MEM), 
        .RegWrite_in(RegWrite_out_MEMWB),
        //OUT
        .nPCout(nPCout_IDEX),
        .A(A_IDEX),
        .B(B_IDEX),
        .SE(SE_IDEX),
        .RT(RT_IDEX),
        .RD(RD_IDEX),
        .ALUOp(ALUOp_IDEX),
        .ALUSrc(ALUSrc_IDEX),
        .Branch(Branch_IDEX),
        .MemRead(MemRead_IDEX),
        .MemWrite(MemWrite_IDEX),
        .MemtoReg(MemtoReg_IDEX),
        .RegWrite(RegWrite_IDEX),
        .RegDst(RegDst_IDEX)
             );   
    
// Execute
   
   iExecute execute(
         //IN
        .clk(clk_a),
        .reset(reset),
        .n_PCin(nPCout_IDEX),
        .A(A_IDEX),
        .B(B_IDEX),
        .SE(SE_IDEX),
        .RT(RT_IDEX),
        .RD(RD_IDEX),
        .ALUOp(ALUOp_IDEX),
        .ALUSrc(ALUSrc_IDEX),
        .Branch_in(Branch_IDEX),
        .MemRead_in(MemRead_IDEX),
        .MemWrite_in(MemWrite_IDEX),
        .MemtoReg_in(MemtoReg_IDEX),
        .RegWrite_in(RegWrite_IDEX),
        .RegDst(RegDst_IDEX),
        //OUT
        .Branch_Target(Branch_Target_EXMEM),
        .Result(Result_EXMEM),
        .MemWriteData(MemWriteData_EXMEM),
        .RegDstAddress(RegDstAddress_EXMEM),
        .zero(zero_EXMEM),
        .Branch_out(Branch_out_EXMEM),
        .MemRead_out(MemRead_out_EX),
        .MemWrite_out(MemWrite_out_EXMEM),
        .RegWrite_out(RegWrite_out_EXMEM),
        .MemtoReg_out(MemtoReg_out_EXMEM)
        ); 
    
// Memory
iMemory#(MEMSIZE) memory(
        //IN
        .clk(clk_a),
        .reset(reset),
        .zero(zero_EXMEM),
        .Branch(Branch_out_EXMEM),
        .MemRead(MemRead_out_EX),
        .MemWrite(MemWrite_out_EXMEM),
        .RegWrite_in(RegWrite_out_EXMEM),
        .MemtoReg_in(MemtoReg_out_EXMEM),
        .RegDstAddress_in(RegDstAddress_EXMEM),
        .ALUResult_in(Result_EXMEM),
        .MemWriteData(MemWriteData_EXMEM),
        //OUT
        .RegWrite_out(RegWrite_out_MEMWB),
        .MemtoReg_out(MemtoReg_out_MEMWB),
        .PCSrc(PCSrc_MEM),
        .RegDstAddress_out(RegDstAddress_out_MEM),
        .MemReadData(MemReadData_MEMWB),
        .ALUResult_out(ALUResult_out_MEMWB)
        );

// Write Back
iWriteBack writeback(
        //IN
        .MemToReg(MemtoReg_out_MEMWB),
        .ALU_result(ALUResult_out_MEMWB),
        .Mem_result(MemReadData_MEMWB),
        //OUT
        .result(result)
    );
    
// sends a reset pulse at the start and puts in run mode
// must be last so runs first (Verilog uses a stack to simulate)
initial begin
    reset<=1;
    run<=0;
    #(2*`CYCLE/3) reset<=0;
    run<=1;
end
endmodule
