`timescale 1ns / 1ps

module mux_test;

	reg [15:0] Ain;
	reg [15:0] Bin;
	reg control;
	wire [15:0] mux_out;

	mux#(16) uut (
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
        
        Ain <= 5'd10;
        Bin <= 5'd56;
        control <= 5'd0;
        //Expected: 10
        
        #10;
        control <= 1; //Expected 56 --> interesting error, discuss in report
        #10;
        
         Ain <= 5'd3;
         Bin <= 5'd2;
         control <= 5'd1;
         //Expected: 2
         
         #10;
         
         
         Ain <= 5'd10;
         Bin <= 5'd0;
         control <= 5'd0;
                //Expected: 10

	end
      
endmodule

