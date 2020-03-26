`timescale 1ns/1ns
module Simulate();
  reg [3:0] a, b;
  reg sel;
  wire [3:0] s;
  wire cout;

  // a +- b
  AddSub4 add_sub(a, b, sel, cout, s);

  initial
  begin
    $dumpfile("wave.vcd");
    $dumpvars;
    $display("reset");

    sel = 0;
    a = 4'b0;
    b = 4'b0;

    // 5 + 1 = 0101 + 0001 = 0110
    # 101
    sel = 0;
    a = 4'd5;
    b = 4'd1;

    // 5 - 1 = 0101 - 0001 = 0110 + 1110
    # 10
    sel = 1;
    a = 4'd5;
    b = 4'd1;

    // 0 + 0 = 0
    # 10
    sel = 0;
    a = 4'd0;
    b = 4'd0;

    // 0 - 0 = 0
    # 10
    sel = 1;
    a = 4'd0;
    b = 4'd0;

    // 2 + 2 = 4
    # 10
    sel = 0;
    a = 4'd2;
    b = 4'd2;

    // 2 - 2 = 0
    # 10
    sel = 1;
    a = 4'd2;
    b = 4'd2;

    // 1 + 5 = 6
    # 10
    sel = 0;
    a = 4'd1;
    b = 4'd5;

    // 1 - 5 = 
    # 10
    sel = 1;
    a = 4'd1;
    b = 4'd5;


    #10 $display("finish");
    $finish;
  end
endmodule
