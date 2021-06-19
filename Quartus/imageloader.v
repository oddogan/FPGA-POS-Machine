module imageloader(clk, x, y, r, g, b);

	input clk;
	
    localparam image_width = 48;
    localparam image_height = 48;
	 integer index = 0;

    // Coordinates in the display
    input [9:0] x, y;

    // The RGB values in the corresponding pixel
    output reg [7:0] r, g, b;

    reg [7:0] data [0:3*(image_width*image_height-1)];

    initial
        $readmemh("bitmap.txt", data);

    always @(posedge clk)
    begin
			index = (y * image_width + x) * 3;
        if (y < image_height && x < image_width)
        begin
            r = data[index];
            g = data[index+1];
            b = data[index+2]; 
        end
        else
        begin
            r = 8'b0;
            g = 8'b0;
            b = 8'b0;
        end
    end


endmodule