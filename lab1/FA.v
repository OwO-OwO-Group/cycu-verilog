`timescale 1ns/1ns

module FA(a, b, c, cout, sum);
  input a, b, c;
  output sum, cout;

  wire inner_xor_output;

  assign inner_xor_output = a ^ b;
  assign sum = inner_xor_output ^ c;
  assign cout = (c & inner_xor_output) | (a & b);
endmodule
