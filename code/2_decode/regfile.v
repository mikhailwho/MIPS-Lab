`include "definitions.vh"

module regfile#(
    parameter SIZE=32, bits=`CLOG2(SIZE))(
    input clk,
    input reset,
    input write,
    input [(bits - 1):0] address_A,
    input [(bits - 1):0] address_B,
    input [(bits - 1):0] address_dest,
    input [`WORD - 1:0] write_data,
    output reg [`WORD - 1:0] A=`WORD'b0,
    output reg [`WORD - 1:0] B=`WORD'b0
    );
    
    reg[`WORD - 1:0] rf [SIZE-1:0];
    //integer i;//uncomment for reset code
    
    // handle input
    always @(negedge(clk))begin
        //reset is commented out to allow data
        //loading at start, didn't delete FYI
        //if (reset)
        //    for(i=0;i<SIZE;i=i+1)
        //        rf[i]<=0;
        //else 
        
        //your code
        if(write)
            begin
                rf[address_dest] <= write_data;
                
            end
            
    end
    
    //handle output
    always @(posedge(clk))begin
        //your code
        A <= rf[address_A];
        B <= rf[address_B];
        
    end
    
    initial
        $readmemh(`RMEMFILE, rf);

endmodule
