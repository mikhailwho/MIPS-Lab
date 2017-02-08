`timescale 1ns / 1ps
`define MUXSIZE 16
`define SIZE 5

module mux_test;

	reg [15:0] Ain;
	reg [15:0] Bin;
	reg control;
	wire [15:0] mux_out;

	mux#(`SIZE) uut (
		.Ain(Ain), 
		.Bin(Bin), 
		.control(control), 
		.mux_out(mux_out)
	);

	initial begin
		Ain <= 0;
		Bin <= 0;
		control <= 0;
        #10;
        
        Ain <= `SIZE'd10;
        Bin <= `SIZE'd56;
        control <= `SIZE'd0;
        //Expected: 10
        
        #10;
        control <= 1; //Expected 56
        #10;
        
         Ain <= `SIZE'd3;
         Bin <= `SIZE'd2;
         control <= `SIZE'd1;
         //Expected: 2
         
         #10;
         
         
         Ain <= `SIZE'd10;
         Bin <= `SIZE'd0;
         control <= `SIZE'd0;
                //Expected: 10

	end
      
endmodule

