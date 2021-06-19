module FPGAPOSMachine(clk, sw, hsync, vsync, vga_clock, red, green, blue, blank, sync);

	input clk;
	input [7:0] sw;
	output hsync, vsync, vga_clock;
	output [7:0] red, green, blue;
	output reg blank, sync;

	always begin
	blank <= 1;
	sync <= 1;
	end
	
	wire video_on;
	wire [9:0] x, y;
    wire [7:0] red_wire, green_wire, blue_wire;

	vgasync vgasync(.clk(clk), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(vga_clock), .x(x), .y(y));
    imageloader imload(.clk(vga_clock), .x(x), .y(y), .r(red_wire), .g(green_wire), .b(blue_wire))

	// Register for 8-bit RGB
    reg [7:0] red_reg;
    reg [7:0] green_reg;
    reg [7:0] blue_reg;

	// RGB Buffer
    always @(posedge vga_clock)
	 begin
        begin
            red_reg <= red_wire;
            green_reg <= green_wire;
            blue_reg <= blue_wire;
        end
	end

    // Output
    assign red = video_on ? red_reg : 8'b0;
    assign green = video_on ? green_reg : 8'b0;
    assign blue = video_on ? blue_reg : 8'b0;


endmodule
