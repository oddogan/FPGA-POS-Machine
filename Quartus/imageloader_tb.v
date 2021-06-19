module imageloader_tb();

	reg [9:0] x, y;
	integer i_x, i_y;
	reg clk;
	wire [7:0] r, g, b;
	
	initial
	begin
		clk = 0;
		x = 10'b0000000000;
		y = 10'b0000000000;
	end
	

	
	always
	begin
		#20; clk = ~clk;
	end
	
	always @(posedge clk)
	begin
		
		if(x<2)
			x <= x+1;
		else
		begin
			x <= 0;
			if(x == 2)
			begin
				if(y < 1)
				y <= y+1;
				else
				y <= 0;
			end
		end
		
	end
	
		imageloader imageloader_dut(clk, x, y, r, g, b);
	
	

endmodule