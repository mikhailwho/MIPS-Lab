`include "definitions.vh"

module buffer_ifid#(parameter DELAY=0)(
    input clk,
    input reset,
    input [`WORD-1:0] nPC_if,
    input [`WORD-1:0] IR_if,
    output reg[`WORD-1:0] nPC_id=`ZERO,
    output reg[`WORD-1:0] IR_id=`ZERO
    );

    always @(negedge(clk), posedge(reset))
    begin
      #(`DELAY);
      if (reset)
      begin
        nPC_id<=`ZERO;
        IR_id<=`ZERO;
      end
      else
      begin
        nPC_id<=nPC_if;
        IR_id<=IR_if;
      end
    end
endmodule
