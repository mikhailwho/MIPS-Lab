`include "definitions.vh"

module control_testbench;

    reg [5:0] Opcode;
    wire RegDst;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;

    control#() uut(
    .Opcode(Opcode),
    .RegDst(RegDst),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
    );

    initial begin
    
    Opcode = `RTYPE;
    #15;
    
    Opcode = `LW;
    #15;
    
    Opcode = `SW;
    #15;
    
    Opcode = `BEQ;
    #15;
    
    Opcode = 6'b111111;
    #15;
    
    end



endmodule