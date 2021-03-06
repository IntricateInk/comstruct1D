/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_9 (
    input [7:0] a,
    input [2:0] b,
    input [1:0] alufn,
    output reg [7:0] result
  );
  
  
  
  always @* begin
    
    case (alufn)
      2'h0: begin
        result = a << b;
      end
      2'h1: begin
        result = a >> b;
      end
      2'h3: begin
        result = $signed(a) >>> b;
      end
      default: begin
        result = 1'h0;
      end
    endcase
  end
endmodule
