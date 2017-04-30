`include "definitions.vh"

module iMemory#(parameter SIZE=1024)(
    input clk,
    input reset,
    input zero,
    input Branch,
    input MemRead,
    input MemWrite,
    input RegWrite_in,
    input MemtoReg_in,
    input [4:0] RegDstAddress_in,
    input [`WORD-1:0] ALUResult_in,
    input [`WORD-1:0] MemWriteData,
    output RegWrite_out,
    output MemtoReg_out,
    output PCSrc,
    output [4:0] RegDstAddress_out,
    output [`WORD-1:0] MemReadData,
    output [`WORD-1:0] ALUResult_out
    );
    wire [`WORD-1:0] MemReadData_nb;
    
    and branchAnd(PCSrc,Branch,zero);

    data_mem#(SIZE) RAM(
    .clk(clk),
    .reset(reset),
    .write(MemWrite),
    .read(MemRead),
    .address(ALUResult_in),
    .write_data(MemWriteData),
    .read_data(MemReadData_nb)
    );

buffer_memwb BufMemWB(
    .clk(clk), 
    .reset(reset),
    .RegDstAddress_in(RegDstAddress_in),
    .MemReadData_in(MemReadData_nb),
    .ALUResult_in(ALUResult_in),
    .MemtoReg_in(MemtoReg_in), 
    .RegWrite_in(RegWrite_in),
    .RegDstAddress_out(RegDstAddress_out),
    .MemReadData_out(MemReadData),
    .ALUResult_out(ALUResult_out),
    .MemtoReg_out(MemtoReg_out), 
    .RegWrite_out(RegWrite_out)
);

endmodule
