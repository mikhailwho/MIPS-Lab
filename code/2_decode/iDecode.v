`include "definitions.vh"

module iDecode(
    input clk,
    input reset,
    input [`WORD-1:0] nPC,
    input [`WORD-1:0] IR,
    input [`WORD-1:0] Result,
    input [4:0] WriteAddress,
    input RegWrite_in,
    output [`WORD-1:0] nPCout,
    output [`WORD-1:0] A,
    output [`WORD-1:0] B,
    output [`WORD-1:0] SE,
    output [4:0] RT,
    output [4:0] RD,
    output [1:0] ALUOp,
    output ALUSrc,
    output Branch,
    output MemRead,
    output MemWrite,
    output MemtoReg,
    output RegWrite,
    output RegDst
    );
   // %_nb means no buffer, i.e. before the buffer
    wire [`WORD-1:0] A_nb;
    wire [`WORD-1:0] B_nb;
    wire [`WORD-1:0] SE_nb;
    wire [1:0] ALUOp_nb;
    wire ALUSrc_nb;
    wire Branch_nb;
    wire MemRead_nb;
    wire MemWrite_nb;
    wire MemtoReg_nb;
    wire RegWrite_nb;
    wire RegDst_nb;
        
    control  TheControl(
        .Opcode(IR[31:26]),
        .RegDst(RegDst_nb),
        .Branch(Branch_nb),
        .MemRead(MemRead_nb),
        .MemtoReg(MemtoReg_nb),
        .ALUOp(ALUOp_nb),
        .MemWrite(MemWrite_nb),
        .ALUSrc(ALUSrc_nb),
        .RegWrite(RegWrite_nb)
        );

    regfile myRegfile(
        .clk(clk),
        .reset(reset),
        .write(RegWrite_in),
        .address_A(IR[25:21]),
        .address_B(IR[20:16]),
        .address_dest(WriteAddress),
        .write_data(Result),
        .A(A_nb),
        .B(B_nb)
        );

    sign_extender mySE(
        .in(IR[15:0]),
        .out(SE_nb)
        );
    
    buffer_IDEX bufid(
            .clk(clk),
            .reset(reset),
            .nPC_in(nPC),
            .A_in(A_nb),
            .B_in(B_nb),
            .SE_in(SE_nb),
            .RT_in(IR[20:16]),
            .RD_in(IR[15:11]), 
            .ALUOp_in(ALUOp_nb),
            .ALUSrc_in(ALUSrc_nb),
            .Branch_in(Branch_nb),
            .MemRead_in(MemRead_nb),
            .MemWrite_in(MemWrite_nb),
            .MemtoReg_in(MemtoReg_nb),
            .RegWrite_in(RegWrite_nb),
            .RegDst_in(RegDst_nb),
            .nPC_out(nPCout),
            .A_out(A),
            .B_out(B),
            .SE_out(SE),
            .RT_out(RT),
            .RD_out(RD),
            .ALUOp_out(ALUOp),
            .ALUSrc_out(ALUSrc),
            .Branch_out(Branch),
            .MemRead_out(MemRead),
            .MemWrite_out(MemWrite),
            .MemtoReg_out(MemtoReg),
            .RegWrite_out(RegWrite),
            .RegDst_out(RegDst)
            );
endmodule
