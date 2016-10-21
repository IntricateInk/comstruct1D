/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    input [23:0] io_dip,
    output reg [23:0] io_led,
    output reg [7:0] io_seg
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  wire [8-1:0] M_alu_result;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_2 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .result(M_alu_result)
  );
  
  wire [8-1:0] M_tester_a;
  wire [8-1:0] M_tester_b;
  wire [5-1:0] M_tester_alufn;
  wire [4-1:0] M_tester_testcase;
  reg [1-1:0] M_tester_i;
  tester_3 tester (
    .clk(clk),
    .rst(rst),
    .i(M_tester_i),
    .a(M_tester_a),
    .b(M_tester_b),
    .alufn(M_tester_alufn),
    .testcase(M_tester_testcase)
  );
  
  wire [1-1:0] M_slowclk_out;
  slowclock_4 slowclk (
    .clk(clk),
    .rst(rst),
    .out(M_slowclk_out)
  );
  
  wire [7-1:0] M_seg0_segs;
  reg [4-1:0] M_seg0_char;
  segment_5 seg0 (
    .char(M_seg0_char),
    .segs(M_seg0_segs)
  );
  
  reg [15:0] M_c_d, M_c_q = 1'h0;
  
  always @* begin
    M_c_d = M_c_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    M_seg0_char = M_tester_testcase;
    M_tester_i = M_slowclk_out;
    io_seg = ~M_seg0_segs;
    
    case (io_dip[0+6+1-:2])
      2'h0: begin
        M_alu_a = io_dip[16+7-:8];
        M_alu_b = io_dip[8+7-:8];
        M_alu_alufn = io_dip[0+0+5-:6];
        io_led[8+7-:8] = io_dip[8+7-:8];
        io_led[16+7-:8] = io_dip[16+7-:8];
      end
      2'h2: begin
        M_alu_a = M_c_q[0+7-:8];
        M_alu_b = M_c_q[8+7-:8];
        M_alu_alufn = io_dip[0+0+5-:6];
        io_led[8+7-:8] = M_c_q[8+7-:8];
        io_led[16+7-:8] = M_c_q[0+7-:8];
      end
      2'h1: begin
        M_alu_a = M_tester_a;
        M_alu_b = M_tester_b;
        M_alu_alufn = M_tester_alufn;
        io_led[8+7-:8] = M_tester_b;
        io_led[16+7-:8] = M_tester_a;
      end
      default: begin
        M_alu_a = 1'h0;
        M_alu_b = 1'h0;
        M_alu_alufn = 1'h0;
        io_led[8+7-:8] = 1'h0;
        io_led[16+7-:8] = 1'h0;
      end
    endcase
    M_c_d = M_c_q + M_slowclk_out;
    io_led[0+7-:8] = M_alu_result;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_c_q <= 1'h0;
    end else begin
      M_c_q <= M_c_d;
    end
  end
  
endmodule