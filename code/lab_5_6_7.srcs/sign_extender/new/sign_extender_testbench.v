`timescale 1ns / 1ps
`include "definitions.vh"

module sign_extender_testbench;

    reg [(`WORD/2)-1:0] num_in;
    wire [`WORD-1:0] num_out;

    sign_extender#() uut(
    .in(num_in),
    .out(num_out)
    );

    initial begin
    
    
    
    
    end

endmodule
