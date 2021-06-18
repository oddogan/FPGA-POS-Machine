module vgasync(clk, reset, hsync, vsync, video_on, p_tick, x, y);

	input wire clk, reset;
	output wire hsync, vsync, video_on, p_tick;
	output wire [9:0] x, y;
	
	// Constant declarations for VGA sync parameters
	localparam H_DISPLAY = 640; // Horizontal Display Area
	localparam H_BACK_PORCH = 48; // Horizontal Back Porch
	localparam H_FRONT_PORCH = 16; // Horizontal Front Porch
	localparam H_SYNC_PULSE = 96; // Horizontal Sync Pulse
	localparam H_MAX = H_DISPLAY + H_BACK_PORCH + H_FRONT_PORCH + H_SYNC_PULSE - 1;
	localparam START_H_SYNC_PULSE = H_DISPLAY + H_FRONT_PORCH;
	localparam END_H_SYNC_PULSE = H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE - 1;

	localparam V_DISPLAY = 480; // Horizontal Display Area
	localparam V_BACK_PORCH = 33; // Horizontal Back Porch
	localparam V_FRONT_PORCH = 10; // Horizontal Front Porch
	localparam V_SYNC_PULSE = 2; // Horizontal Sync Pulse
	localparam V_MAX = V_DISPLAY + V_BACK_PORCH + V_FRONT_PORCH + V_SYNC_PULSE - 1;
	localparam START_V_SYNC_PULSE = V_DISPLAY + V_FRONT_PORCH;
	localparam END_V_SYNC_PULSE = V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE - 1;

	// A Mod-2 Counter to generate 25MHz pixel tick from 50Mhz clock
	reg pixel_reg = 0;
	wire pixel_next, pixel_tick;

	always@(posedge clk)
		pixel_reg <= pixel_next;

	assign pixel_next = ~pixel_reg; // Next state will be the complement of current
	assign pixel_tick = (pixel_reg == 0); // Assert pixel tick half of the time
	
	// Registers to keep track of the current pixel location
	reg [9:0] h_count_reg, h_count_next, v_count_reg, v_count_next;
	initial
		begin
			h_count_reg = 0;
			h_count_next = 0;
			v_count_reg = 0;
			v_count_next = 0;
		end

	// Registers to keep track of VSYNC and HSYNC Signal States
	reg vsync_reg, hsync_reg;
	wire vsync_next, hsync_next;

	// Infer the registers
	always @(posedge clk, posedge reset)
		if(reset)
			begin
				v_count_reg <= 0;
				h_count_reg <= 0;
				vsync_reg <= 0;
				hsync_reg <= 0;
			end
		else
			begin
				v_count_reg <= v_count_next;
				h_count_reg <= h_count_next;
				vsync_reg <= vsync_next;
				hsync_reg <= hsync_next;
			end
	
	// Next-State logic of the HSYNC and VSYNC Counters
	always @*
		begin
			h_count_next = (clk ? ((h_count_reg == H_MAX) ? 0 : h_count_reg + 1) : h_count_next);
			v_count_next = (clk && h_count_reg == H_MAX) ? (v_count_reg == V_MAX ? 0 : v_count_reg + 1) : v_count_next;
		end

	/* HSYNC and VSYNC are active LOW signals */
	
	// Assert HSYNC during HSYNC Pulse
	assign hsync_next = ~(h_count_reg >= START_H_SYNC_PULSE && h_count_reg <= END_H_SYNC_PULSE);

	// Assert VSYNC during VSYNC Pulse
	assign vsync_next = ~(v_count_reg >= START_V_SYNC_PULSE && v_count_reg <= END_V_SYNC_PULSE);

	// Video should be on only in display region
	assign video_on = (h_count_reg < H_DISPLAY) && (v_count_reg < V_DISPLAY);

	// Assign output signals
	assign hsync = hsync_reg;
	assign vsync = vsync_reg;
	assign x = h_count_reg;
	assign y = v_count_reg;
	assign p_tick = pixel_tick;
	//assign p_tick = clk;

endmodule
