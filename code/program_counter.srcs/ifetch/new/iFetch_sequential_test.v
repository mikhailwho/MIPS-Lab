`timescale 1ns / 1ps
`include "definitions.vh"

module iFetch_sequential_test;

wire clk;
reg reset;
reg PCSrc;
reg [`WORD-1:0] BrDest;
wire [`WORD-1:0] nPC;
wire [`WORD-1:0] IR;

    
    oscillator#() clock(
    .clk(clk)
    );
    
    
    iFetch#() uut (
    .clk(clk),
    .reset(reset),
    .PCSrc(PCSrc),
    .BrDest(BrDest),
    .nPC(nPC),
    .IR(IR)
    );
    
    initial begin
    
    reset = 0;
    PCSrc = 0;
    BrDest = 0;
    
    #10;
    
    end
endmodule
