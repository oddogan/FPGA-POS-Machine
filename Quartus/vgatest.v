module vgatestbench;

    reg reset;
    reg [7:0] sw;
    wire hsync, vsync, p_tick, clk;
    wire [7:0] red;
    wire [7:0] green;
    wire [7:0] blue;
    
    initial
    begin
        reset = 0;
        sw = 8'b00010001;
    end
	 
    // Register for 8-bit RGB
    reg [7:0] red_reg;
    reg [7:0] green_reg;
    reg [7:0] blue_reg;

    // Video status output from vga_sync to tell when to route out RGB signal
    wire video_on;

    // Instantiate clock generator
    clkgenerator clkgenerator_dut(.clk(clk));

    // Instantiate vga_sync
    vgasync vgasync_dut(.clk(clk), 
                          .reset(reset),
                          .hsync(hsync),
                          .vsync(vsync),
                          .video_on(video_on),
                          .p_tick(p_tick),
                          .x(),
                          .y()
                          );
								  
    // RGB Buffer
    always @(posedge clk, posedge reset)
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