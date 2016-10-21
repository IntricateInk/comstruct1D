/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_2 (
    input [7:0] a,
    input [7:0] b,
    input [5:0] alufn,
    output reg [7:0] result
  );
  
  
  
  wire [8-1:0] M_boole_boole;
  reg [8-1:0] M_boole_a;
  reg [8-1:0] M_boole_b;
  reg [4-1:0] M_boole_alufn;
  boolean_6 boole (
    .a(M_boole_a),
    .b(M_boole_b),
    .alufn(M_boole_alufn),
    .boole(M_boole_boole)
  );
  
  wire [8-1:0] M_add_result;
  wire [1-1:0] M_add_z;
  wire [1-1:0] M_add_v;
  wire [1-1:0] M_add_n;
  reg [8-1:0] M_add_a;
  reg [8-1:0] M_add_b;
  reg [1-1:0] M_add_alufn;
  adder_7 add (
    .a(M_add_a),
    .b(M_add_b),
    .alufn(M_add_alufn),
    .result(M_add_result),
    .z(M_add_z),
    .v(M_add_v),
    .n(M_add_n)
  );
  
  wire [1-1:0] M_compare_compareout;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  reg [2-1:0] M_compare_alufn;
  compare_8 compare (
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .alufn(M_compare_alufn),
    .compareout(M_compare_compareout)
  );
  
  wire [8-1:0] M_shift_result;
  reg [8-1:0] M_shift_a;
  reg [3-1:0] M_shift_b;
  reg [2-1:0] M_shift_alufn;
  shifter_9 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .result(M_shift_result)
  );
  
  wire [8-1:0] M_multi_multi;
  reg [8-1:0] M_multi_a;
  reg [8-1:0] M_multi_b;
  multiplier_10 multi (
    .a(M_multi_a),
    .b(M_multi_b),
    .multi(M_multi_multi)
  );
  
  reg [7:0] output00;
  
  always @* begin
    M_boole_a = a;
    M_boole_b = b;
    M_boole_alufn = alufn[0+3-:4];
    M_add_a = a;
    M_add_b = b;
    M_add_alufn = alufn[0+0-:1];
    M_compare_z = M_add_z;
    M_compare_v = M_add_v;
    M_compare_n = M_add_n;
    M_compare_alufn = alufn[1+1-:2];
    M_shift_a = a;
    M_shift_b = b[0+2-:3];
    M_shift_alufn = alufn[0+1-:2];
    M_multi_a = a;
    M_multi_b = b;
    if (alufn[0+1-:2] == 2'h2) begin
      output00 = M_multi_multi;
    end else begin
      output00 = M_add_result;
    end
    
    case (alufn[4+1-:2])
      2'h0: begin
        result = output00;
      end
      2'h1: begin
        result = M_boole_boole;
      end
      2'h2: begin
        result = M_shift_result;
      end
      2'h3: begin
        result = M_compare_compareout;
      end
      default: begin
        result = 1'h0;
      end
    endcase
  end
endmodule
