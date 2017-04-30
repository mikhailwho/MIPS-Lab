`include "definitions.vh"

`define index ((`WORD/2)-1)
`define n (`WORD/2)

module sign_extender(
    input [(`WORD/2)-1:0] in,
    output [`WORD-1:0] out
    );
    assign out = {{(`n){in[(`index)]}} , in };
endmodule
