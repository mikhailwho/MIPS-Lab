`include "definitions.vh"


module test_regs;

wire clk;
reg rst=0;
reg[`WORD - 1:0] d;
wire[`WORD - 1:0] q;

oscillator clk_gen(clk);

register UUT(
    .clk(clk),
    .reset(rst),
    .D(d),
    .Q(q)
    );

initial
begin
    d<=`WORD'd0; #`CYCLE;
    d<=`WORD'd1; #`CYCLE;
    d<=`WORD'd2; #`CYCLE;
    d<=`WORD'd3; #`CYCLE;
    d<=`WORD'd4; #(`CYCLE/5);
    d<=`WORD'd5; #(`CYCLE*4/5);

    rst = 1; #(`CYCLE);  //RESET HIGH
       
    d<=`WORD'd29; #(`CYCLE);
    
    rst = 0; #(`CYCLE); //RESET LOW
    
    d<=`WORD'd30; #(`CYCLE);
    d<=`WORD'd31; #(`CYCLE);
    
    d<=`WORD'd4294967295; #(`CYCLE); //All bits HIGH
    
    
end
endmodule
