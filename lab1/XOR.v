`timescale 1ns/1ns
module XOR(a, b, out);
  input a, b;
  output out;

  assign out = a ^ b;

endmodule
