`timescale 1ns / 1ps
`include "definitions.vh"

module iFetch_branch;

    wire clock;   
    reg reset;
    reg PCSrc;
    reg [`WORD-1:0] BrDest;
    wire [`WORD-1:0] nPC;
    wire [`WORD-1:0] IR;
    
    oscillator#() clock_signal(
    .clk(clock)
    );
    
    iFetch#() uut(
    .clk(clock),
    .reset(reset),
    .PCSrc(PCSrc),
    .BrDest(BrDest),
    .nPC(nPC),
    .IR(IR)
    );
    
    initial begin
    
    reset = 0;
    PCSrc = 1;
    BrDest = 3;
    #15;
    
    BrDest = 9;
    #15;
    
    BrDest = 1024;
    #15;
    
    end

endmodule