module FPGAPOSMachine(clk, reset, sw, hsync, vsync, vga_clock, red, green, blue);

	input clk, reset;
	input [7:0] sw;
	output hsync, vsync, vga_clock;
	output [7:0] red, green, blue;

	wire video_on;
	reg [9:0] x, y;

	vgasync vgasync(.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(vga_clock), .x(x), .y(y));

	// Register for 8-bit RGB
    reg [7:0] red_reg;
    reg [7:0] green_reg;
    reg [7:0] blue_reg;

	// RGB Buffer
    always @(posedge vga_clock, posedge reset)
        if (reset)
            begin
                red_reg <= 0;
                green_reg <= 0;
                blue_reg <= 0;
            end
        else
            begin
                red_reg <= sw;
                green_reg <= sw;
                blue_reg <= sw;
            end

    // Output
    assign red = video_on ? red_reg : 8'b0;
    assign green = video_on ? green_reg : 8'b0;
    assign blue = video_on ? blue_reg : 8'b0;


endmodule
