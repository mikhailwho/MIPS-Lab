`include "definitions.vh"

module iExecute_test;

    wire clk;
    reg reset;
    reg [`WORD-1:0] n_PCin;
    reg [`WORD-1:0] A;
    reg [`WORD-1:0] B;
    reg [`WORD-1:0] SE;
    reg [4:0] RT;
    reg [4:0] RD;
    reg [1:0] ALUOp;
    reg ALUSrc;
    reg RegDst;
    reg Branch_in;
    reg MemRead_in;
    reg MemWrite_in;
    reg RegWrite_in;
    reg MemtoReg_in;
    wire [`WORD-1:0] Branch_Target;
    wire [`WORD-1:0] Result;
    wire [`WORD-1:0] MemWriteData;
    wire [4:0] RegDstAddress;
    wire zero;
    wire Branch_out;
    wire MemRead_out;
    wire MemWrite_out;
    wire RegWrite_out;
    wire MemtoReg_out;

    
    oscillator clock_sig(
        .clk(clk)
    );

    iExecute execute_uut(
        .clk(clk),
        .reset(reset),
        .n_PCin(n_PCin),
        .A(A),
        .B(B),
        .SE(SE),
        .RT(RT),
        .RD(RD),
        .ALUOp(ALUOp),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .Branch_in(Branch_in),
        .MemRead_in(MemRead_in),
        .MemWrite_in(MemWrite_in),
        .RegWrite_in(RegWrite_in),
        .MemtoReg_in(MemtoReg_in),
        .Branch_Target(Branch_Target),
        .Result(Result),
        .MemWriteData(MemWriteData),
        .RegDstAddress(RegDstAddress),
        .zero(zero),
        .Branch_out(Branch_out),
        .MemRead_out(MemRead_out),
        .MemWrite_out(MemWrite_out),
        .RegWrite_out(RegWrite_out),
        .MemtoReg_out(MemtoReg_out)
    );
    
    
    
    initial begin
    
        reset <= 0;
        n_PCin <= 0;
        A <= 0;
        B <= 0;
        SE <= 0;
        RT <= 0;
        RD <= 0;
        ALUOp <= 0;
        ALUSrc <= 0;
        RegDst <= 0;
        Branch_in <= 0;
        MemRead_in <= 0;
        MemWrite_in <= 0;
        RegWrite_in <= 0;
        MemtoReg_in <= 0;
    
        #5; 
        A <= 3;
        B <= 2;
        SE <= `F_OR;
        RT <= 10;
        RD <= 11;
        
        #5;
        ALUOp <= `ALUOp_ADD; // adds A and B
        
        #10;
        ALUOp <= `ALUOp_SUB; // A - B
        
        #10;
        ALUOp <= `ALUOp_R; // r type command, expected A | B from previous values
        
        #10;
        A <= 15;
        B <= 15;
        
        #10;
        ALUOp <= `ALUOp_SUB; // should be zero
        
        #10;
        A <= `WORD'hFFFFFFFF;
        B <= `WORD'hFFFFFFFF;
        
        #10;
        ALUOp <= `ALUOp_ADD; // should have overflow
        
        #10;
        ALUOp = 2'b11; // should have nothing happen, 23 isn't a valid code;
        
        #10;
        reset = 1;
        
    end
    
endmodule