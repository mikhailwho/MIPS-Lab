`include "definitions.vh"

module aluControl_testbench;

    reg [1:0] ALUOp;
    reg [5:0] funct;
    
    wire [3:0] ALU_control;

    ALU_control control_test(
        .ALUOp(ALUOp),
        .funct(funct),
        .ALU_control(ALU_control)
    );
    



    initial begin
        
        ALUOp = 0;
        funct = 0;
        
        #10;       
        ALUOp = `ALUOp_ADD; // expected ALU_control = 0010
        
        #10;        
        ALUOp = `ALUOp_SUB; // expected ALU_control = 0110
        
        #10;       
        ALUOp = `ALUOp_R;
        funct = `F_ADD; // expected ALU_control = 0010
        
        #10;
        funct = `F_SUB; // expected ALU_control = 0110
        
        #10; 
        funct = `F_AND; // expected ALU_control = 0000
        
        #10; 
        funct = `F_OR; // expected ALU_control = 0001
        
        #10; 
        funct = `F_NOR; // expected ALU_control = 1100
        
        #10; 
        funct = `F_SLT; // expected ALU_control = 0111
                
    end
    
    
    
    
    
endmodule
    
