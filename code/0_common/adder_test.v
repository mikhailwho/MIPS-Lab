`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:50:03 01/19/2016
// Design Name:   adder
// Module Name:   C:/Users/schubertk/Documents/GitHub/MIPS-Lab/code/adder_test.v
// Project Name:  regs
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "definitions.vh"

module adder_test;

	// Inputs
	reg [`WORD-1:0] Ain;
	reg [`WORD-1:0] Bin;

	// Outputs
	wire [`WORD-1:0] add_out;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.Ain(Ain), 
		.Bin(Bin), 
		.add_out(add_out)
	);

	initial begin
		// Initialize Inputs
		Ain = 0;
		Bin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		Ain = 1;
		Bin = 1;
		//Expected result: d'2
		
		#100;
		
		Ain = 4;
		Bin = 8;
		//Expected result: d'12 - will produce ripple carry
		
		#100;
		
		Ain = 32'hFF00;
		Bin = 32'h00FF;
		//Expected result: h'0000 FFFF -- largest unsigned value
		
		#100;
		
        
        Ain = 32'hFFFF0000;
        Bin = 32'h0000FFFF;
        //Expected result: h'FFFFFFFF -- largest unsigned value
        
        #100;
        
        Ain = 32'hFFFFFFFF;
        Bin = 32'd1;
        // Expected Result:0 (Will cause overflow)
		
		
		#100;
		
		Ain = 32'd1;
		Bin = 32'd0;
		//Expected Result: 1 (Testing adding zero)
		

	end
      
endmodule

