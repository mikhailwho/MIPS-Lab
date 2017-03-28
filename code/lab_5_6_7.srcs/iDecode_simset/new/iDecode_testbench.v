`include "definitions.vh"

module iDecode_testbench;
//Local Variables
    wire clk;
    reg reset;
    reg [`WORD-1:0] nPC;
    reg [`WORD-1:0] IR;
    reg [`WORD-1:0] Result;
    reg [4:0] WriteAddress;
    reg RegWrite_in;
    output [`WORD-1:0] nPCout;
    output [`WORD-1:0] A;
    output [`WORD-1:0] B;
    output [`WORD-1:0] S;
    output [4:0] RT;
    output [4:0] RD;
    output [1:0] ALUOp;
    output ALUSrc;
    output Branch;
    output MemRead;
    output MemWrite;
    output MemtoReg;
    output RegWrite;
    output RegDst;


oscillator clock_sig(
        .clk(clk)
                    );


iDecode uut( 
    .reset(reset),
    .nPC(nPC),
    .IR(IR),
    .Result(Result),
    .WriteAddress(WriteAddress),
    .RegWrite_in(RegWrite_In),
    .nPCout(nPCout),
    .A(A),
    .B(B),
    .SE(SE),
    .RT(RT),
    .RD(RD),
    .ALUOp(ALUOp),
    .ALUSrc(ALUSrc),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .MemtoReg(MemtoReg),
    .RegWrite(RegWrite),
    .RegDst(RegDst)
);


endmodule