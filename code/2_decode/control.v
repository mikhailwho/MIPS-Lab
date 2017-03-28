`include "definitions.vh"

module control(
    input [5:0] Opcode,
    output reg  RegDst,
    output reg  Branch,
    output reg  MemRead,
    output reg  MemtoReg,
    output reg  [1:0] ALUOp,
    output reg  MemWrite,
    output reg  ALUSrc,
    output reg  RegWrite
    );
    always@(*) begin
        case (Opcode)
        `RTYPE: begin
                RegDst<=1;
                Branch<=0;
                MemRead<=0;
                MemtoReg<=0;
                ALUOp<=`ALUOp_R;
                MemWrite<=0;
                ALUSrc<=0;
                RegWrite<=1;
            end
        `LW: begin
                RegDst<=0;
                Branch<=0;
                MemRead<=1;
                MemtoReg<=1;
                ALUOp<=`ALUOp_ADD;
                MemWrite<=0;
                ALUSrc<=1;
                RegWrite<=1;
            end
        `SW: begin
                RegDst<=0;
                Branch<=0;
                MemRead<=0;
                MemtoReg<=0;
                ALUOp<=`ALUOp_ADD;
                MemWrite<=1;
                ALUSrc<=1;
                RegWrite<=0;
            end
        `BEQ: begin
                RegDst<=0;
                Branch<=1;
                MemRead<=0;
                MemtoReg<=0;
                ALUOp<=`ALUOp_SUB;
                MemWrite<=0;
                ALUSrc<=0;
                RegWrite<=0;
            end
        default: begin
                RegDst<=0;
                Branch<=0;
                MemRead<=0;
                MemtoReg<=0;
                ALUOp<=`ALUOp_ADD;
                MemWrite<=0;
                ALUSrc<=0;
                RegWrite<=0;
            end
        endcase
    end
endmodule
