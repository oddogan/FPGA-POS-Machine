module FPGAPOSMachine(clk, reset, sw, hsync, vsync, vga_clock, red, green, blue, blank, sync);

	input clk, reset;
	input [7:0] sw;
	output hsync, vsync, vga_clock;
	output [7:0] red, green, blue;
	output reg blank, sync;

    reg rst = 0;
	
	always begin
	blank <= 1;
	sync <= 1;
	end
	
	wire video_on;
	wire [9:0] x, y;

	vgasync vgasync(.clk(clk), .reset(rst), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(vga_clock), .x(x), .y(y));

	// Register for 8-bit RGB
    reg [7:0] red_reg;
    reg [7:0] green_reg;
    reg [7:0] blue_reg;

	// RGB Buffer
    always @(posedge vga_clock, posedge rst)
	 begin
        if (rst)
            begin
                red_reg <= 0;
                green_reg <= 0;
                blue_reg <= 0;
            end
        else
            begin
                red_reg <= {sw[5:4],6'b000000};
                green_reg <= {sw[3:2],6'b000000};
                blue_reg <= {sw[1:0],6'b000000};
            end
	end
    // Output
    assign red = video_on ? red_reg : 8'b0;
    assign green = video_on ? green_reg : 8'b0;
    assign blue = video_on ? blue_reg : 8'b0;


endmodule
