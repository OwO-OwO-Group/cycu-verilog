`timescale 1ns/1ns
module AddSub4(a, b, sel, cout, s);
  input [3:0] a, b;
  input sel;
  output [3:0] s;
  output cout;

  wire [3:0] invert_b, fa_cout;

  XOR xor0(b[0], sel, invert_b[0]);
  XOR xor1(b[1], sel, invert_b[1]);
  XOR xor2(b[2], sel, invert_b[2]);
  XOR xor3(b[3], sel, invert_b[3]);

  FA fa0(a[0], invert_b[0], sel       , fa_cout[0], s[0]);
  FA fa1(a[1], invert_b[1], fa_cout[0], fa_cout[1], s[1]);
  FA fa2(a[2], invert_b[2], fa_cout[1], fa_cout[2], s[2]);
  FA fa3(a[3], invert_b[3], fa_cout[2], fa_cout[3], s[3]);

  assign cout = fa_cout[3];
endmodule
