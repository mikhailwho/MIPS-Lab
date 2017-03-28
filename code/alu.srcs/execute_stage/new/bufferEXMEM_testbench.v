`include "definitions.vh"

module membuffer_test;

    wire clk; 
    reg reset;
    reg [`WORD-1:0] Branch_Target_in;
    reg [`WORD-1:0] Result_in;
    reg [`WORD-1:0] MemWriteData_in;
    reg [4:0] RegDstAddress_in;
    reg zero_in;
    reg Branch_in; 
    reg MemRead_in; 
    reg MemWrite_in; 
    reg MemtoReg_in; 
    reg RegWrite_in;
    wire [`WORD-1:0] Branch_Target_out;
    wire [`WORD-1:0] Result_out;
    wire [`WORD-1:0] MemWriteData_out;
    wire [4:0] RegDstAddress_out;
    wire zero_out;
    wire Branch_out; 
    wire MemRead_out; 
    wire MemWrite_out; 
    wire MemtoReg_out; 
    wire RegWrite_out;
    
    oscillator clock_signal(
    .clk(clk)
    );
    
    buffer_exmem BufEXMEM(
        .clk(clk), 
        .reset(reset),
        .Branch_Target_in(Branch_Target_in),
        .Result_in(Result_in),
        .MemWriteData_in(B),
        .RegDstAddress_in(RegDstAddress_in),
        .zero_in(zero_in),
        .Branch_in(Branch_in), 
        .MemRead_in(MemRead_in), 
        .MemWrite_in(MemWrite_in), 
        .MemtoReg_in(MemtoReg_in), 
        .RegWrite_in(RegWrite_in),
        .Branch_Target_out(Branch_Target),
        .Result_out(Result),
        .MemWriteData_out(MemWriteData),
        .RegDstAddress_out(RegDstAddress),
        .zero_out(zero),
        .Branch_out(Branch_out), 
        .MemRead_out(MemRead_out), 
        .MemWrite_out(MemWrite_out), 
        .MemtoReg_out(MemtoReg_out), 
        .RegWrite_out(RegWrite_out)
    );


initial begin

     reset <= 0;
     Branch_Target_in <= 0;
     Result_in <= 0;
     MemWriteData_in <= 0;
     RegDstAddress_in <= 0;
     zero_in <= 0;
     Branch_in <= 0; 
     MemRead_in <= 0; 
     MemWrite_in <= 0; 
     MemtoReg_in <= 0; 
     RegWrite_in <= 0;
    
    #5;
    Result_in <= 7;
    MemWriteData_in <= 5;
    MemtoReg_in <= 4;
    
    #5;
    reset <= 1;
    
    #5;
    
    
end

endmodule