`include "definitions.vh"

module data_mem#(
    parameter SIZE=1024)(
    input clk,
    input reset,
    input write,
    input read,
    input [`WORD - 1:0] address,
    input [`WORD - 1:0] write_data, //contents
    output reg [`WORD - 1:0] read_data=`WORD'bz
    );
    localparam HIGH_IMPEDANCE=32'bz;
    reg[`WORD - 1:0] dmem [SIZE-1:0];
   
// integer i;
    
      always@(posedge(clk),posedge(reset))
      begin
      
         if (reset)
              begin 
        
                 read_data = `WORD'b0;
         
              end
        
        //handling inputs and outputs 
        
        else
              begin
              
                    
                    if(address > SIZE)
                        begin
                        
                        read_data <= HIGH_IMPEDANCE; // Failing gracefully if address is outside of range (exclusion)
                        
                        end
                        
                     else 
                     
                        begin
                        
                            if(write)
                            begin
                                    dmem[address] <= write_data; //RT
                             end
                                
                            if(read)
                            begin
                                    read_data <= dmem[address]; 
                             end
                             
                             
                             else
                                begin
                                    read_data <= HIGH_IMPEDANCE; 
                                end   
                      
                            
                            end
                    

              end
      
      
      end
    
    
    //initialize memory from file
    initial
        $readmemh(`DMEMFILE, dmem); //Use for data Mem test

endmodule
