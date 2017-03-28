`include "definitions.vh"

`define SIZE 32
`define bits `CLOG2(`SIZE)

module regfile_test;

wire clk;
reg reset;
reg write;
reg [(`bits - 1):0] address_A;
reg [(`bits - 1):0] address_B;
reg [(`bits - 1):0] address_dest;
reg [`WORD - 1:0] write_data;
wire [`WORD - 1:0] A; //output
wire [`WORD - 1:0] B; //output

oscillator clock(
.clk(clk)
);

regfile#(`SIZE, `bits) uut(

    .clk(clk),
    .reset(reset),
    .write(write),
    .address_A(address_A),
    .address_B(address_B),
    .address_dest(address_dest),
    .write_data(write_data),
    .A(A),
    .B(B)
    );

initial begin

    write <= 0;
    reset <= 0;
    address_A <= 5;
    address_B <= 6;
    address_dest <= 0;
    write_data <= 0;
    
    #5;
    
    address_A <= 0;
    address_B <= 8;
    
    #5;
   write <= 1;
   address_dest <= 8;
   write_data <= B + 10;  
   
   #11;
   
   write = 0;
   address_B <= address_dest;

    
   #5;
   
   write <= 1;
   write_data <= B + 10; //

    #11;
    
    write = 0;
    
    

end

endmodule
