`timescale 1ns/1ns
module AddSub4(a, b, sel, cout, s);
  input [3:0] a, b;
  input sel;
  output [3:0] s;
  output cout;

  wire [4:0] fa_out;

  assign fa_out = (sel == 0 ? (a + b) : (a + ~b + 1));
  assign s = fa_out[3:0];
  assign cout = fa_out[4];
endmodule
