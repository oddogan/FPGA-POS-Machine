module imageloader(clk, x, y, r, g, b);

	input clk;
	
    localparam image_width = 48;
    localparam image_height = 48;

    // Coordinates in the display
    input [9:0] x, y;

    // The RGB values in the corresponding pixel
    output reg [7:0] r, g, b;

    reg [7:0] data [0:image_height-1][0:image_width-1][0:2];

    initial
        $readmemh("bitmap.txt", data);

    always @(posedge clk)
    begin
        if (y < image_height && x < image_width)
        begin
            r = data[y][x][0];
            g = data[y][x][1];
            b = data[y][x][2]; 
        end
        else
        begin
            r = 8'b0;
            g = 8'b0;
            b = 8'b0;
        end
    end


endmodule