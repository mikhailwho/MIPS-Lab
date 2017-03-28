`include "definitions.vh"

module ALU_control(
    input [1:0] ALUOp,
    input [5:0] funct,
    output reg  [3:0] ALU_control
    );
    
    always@(*) begin  
        case(ALUOp)
            `ALUOp_ADD: ALU_control = `ALU_ADD;
            `ALUOp_SUB: ALU_control = `ALU_SUB;
            `ALUOp_R  : case(funct)
                        `F_ADD : ALU_control = `ALU_ADD;
                        `F_SUB : ALU_control = `ALU_SUB;
                        `F_AND : ALU_control = `ALU_AND;
                        `F_OR  : ALU_control = `ALU_OR;
                        `F_NOR : ALU_control = `ALU_NOR;
                        `F_SLT : ALU_control = `ALU_SLT;
                        default : ;
                        endcase
            default : ;
        endcase
    
    end
endmodule
