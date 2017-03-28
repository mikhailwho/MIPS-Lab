`include "definitions.vh"

module alu_testbench;

    reg [`WORD-1:0] A;
    reg [`WORD-1:0] B;
    reg [3:0] ALU_control;
    
    wire [`WORD-1:0] ALUresult;
    wire zero;
 
    ALU alu_test(
        .A(A),
        .B(B),
        .ALU_control(ALU_control),
        .ALUresult(ALUresult),
        .zero(zero)
    );
    
    initial begin

        A = 'h0000;
        B = 'h0000;
        ALU_control = 0;
        
        #10; 
        A = 'h0007;
        B = 'h0005;
        ALU_control = `ALU_ADD; // expected ALUresult = 'h000C
        
        #10; ALU_control = `ALU_SUB; // expected ALUresult = 'h0002
        
        #10; ALU_control = `ALU_AND; // expected ALUresult = 'h0005
        
        #10; ALU_control = `ALU_OR; // expected ALUresult = 'h0007
        
        #10; ALU_control = `ALU_NOR; // expected ALUresult = 'hFFF8

        #10; ALU_control = `ALU_SLT; // expected ALUresult = 'h0000
        
        #10;
        A = 'h0005;
        B = 'h0007;
        ALU_control = `ALU_SLT; // expected ALUresult = 'h0001
        
    end
    
endmodule
    
