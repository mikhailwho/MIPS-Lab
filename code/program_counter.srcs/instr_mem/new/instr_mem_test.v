`timescale 1np / 1ps

`include "definitions.vh"

module instr_mem_test;

    wire clock;
    reg [`WORD-1:0] in_pc;
    wire [`WORD-1:0] instr_out;
    
    oscillator clock_sim(
    .clk(clock)
    );
    
    instr_mem uut (
    .clk(clock),
    .pc(in_pc),
    .instruction(instr_out)
    );
    
    initial begin
    
    in_pc <= 3;
   #100;
   in_pc <= 23;
   #100;
   
   end
   endmodule
   