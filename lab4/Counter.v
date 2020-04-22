`timescale 1ns/1ns
module Counter(dout, rst, clk, en, up);
  input clk, rst, en, up;
  output [7:0] dout;
  reg [7:0] dout;

  always @ (posedge clk)
  begin
    if (!rst)
      dout <= 8'd0;

	case(en)
		1:
		case(up)
			1: 
				if (dout == 8'hff)
					dout <= dout; 
				else
					dout <= dout + 1;
			0:
				if (dout == 8'd0)
					dout <= dout;
				else
					dout <= dout - 1;
		endcase
		
		0:
		dout <= dout;	
	endcase
  end

endmodule