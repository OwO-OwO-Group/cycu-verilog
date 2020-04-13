`timescale 1ns/1ns
module Counter(dout, rst, clk, en, up);
  input clk, rst, en, up;
  output [7:0] dout;
  reg [7:0] dout;

  always @ (posedge clk or negedge rst)
  begin
    if (!rst)
      dout <= 8'd0;

    if (en)
    begin
      if (up && dout < 8'hff)
        dout <= dout + 1;
      else if(!up && dout > 8'h0)
        dout <= dout - 1;
    end
  end

endmodule
