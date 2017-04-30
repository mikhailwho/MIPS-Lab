`include "definitions.vh"

module instr_mem#(
    parameter SIZE=1024)(
    input clk,
    input [`WORD - 1:0] pc,
    output reg [`WORD - 1:0] instruction=`WORD'b0
    );
    
    reg[`WORD - 1:0] imem [SIZE-1:0];
    
    always @(posedge(clk))
        instruction<= imem[pc];
    
    initial
        
        $readmemb(`IMEMFILE, imem);


endmodule
