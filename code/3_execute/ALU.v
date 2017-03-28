`include "definitions.vh"


module ALU(
    input [`WORD-1:0] A,
    input [`WORD-1:0] B,
    input [3:0] ALU_control,
    output reg[`WORD-1:0] ALUresult,
    output zero
    );
    
    assign zero = (ALUresult == 0);
    
    always@(*) begin
    
        case(ALU_control)
            `ALU_ADD : ALUresult = (A + B);
            `ALU_SUB : ALUresult = (A - B);
            `ALU_AND : ALUresult = (A & B);
            `ALU_OR  : ALUresult = (A | B);
            `ALU_NOR : ALUresult = !(A | B);
            `ALU_SLT : ALUresult = (A < B);
            default  : ;
        endcase
    
    end
endmodule
