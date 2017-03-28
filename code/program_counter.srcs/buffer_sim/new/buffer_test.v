`timescale 1ns / 1 ps
`include "definitions.vh"

module buffer_test;

    wire clk;
    reg reset;
    reg [`WORD-1:0] nPC_if;
    reg [`WORD-1:0] IR_if;
    wire [`WORD-1:0] nPC_id;
    wire [`WORD-1:0] IR_id;
    
    oscillator#() clock(
    .clk(clk)
    );
    
    buffer_ifid#() uut(
        .clk(clk),
        .reset(reset),
        .nPC_if(nPC_if),
        .IR_if(IR_if),
        .nPC_id(nPC_id),
        .IR_id(IR_id)
        
    );
        
    initial begin
    
    reset = 0;
    nPC_if = 1;
    IR_if = 1;

    
    #5;
    
    nPC_if = 3;
    
    
    #12;
    
    reset = 1;
    
    #5
    
    reset = 0;
    
    
    end
    
endmodule
    
