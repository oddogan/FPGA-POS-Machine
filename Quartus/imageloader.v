module imageloader(clk, x, y, red, green, blue);

	input clk;
	
    localparam image_width = 48;
    localparam image_height = 48;
	 integer index = 0;
	 integer file;

    // Coordinates in the display
    input [9:0] x, y;

    // The RGB values in the corresponding pixel
    reg [7:0] r, g, b;
	 output [7:0] red, green, blue;
    reg [7:0] apple [0:3*(image_width*image_height)-1];
	 //reg [7:0] banana [0:3*(image_width*image_height)-1];
	 //reg [7:0] rgb [0:2];
	 
    initial
	 begin
			//file = $fopenr("facebook.txt");
        //$readmemh("apple.txt", apple);
		  //$readmemh("banana.txt", banana);
	 end


	 
    always @(posedge clk)
    begin
			//index = ((y-100) * image_width + (x-200)) * 3;
			
        if (y < image_height && x < image_width)
        begin
            //$fread(file, "%h %h %h", index, rgb); 
				r <= 'd45;
				g <= 'd120;
				b <= 'd135;
        end
		  
		  /*
		  else if (y >= 100 && y<image_height+100 && x>199 && x<image_width+200  )
		  begin 
				index = ((y-100) * image_width + (x-200)) * 3;
				/*if(apple[index]=='hff &&apple[index+1]=='hff && apple[index+2]== 'hff)
					begin
					r <= 'd45;
					g <= 'd120;
					b <= 'd135;
					end
				else
					//begin
					r <= apple[index];
					g <= apple[index+1];
					b <= apple[index+2];
					//end
				
				
		  end*/
		  
        else
        begin
            r <= 'd45;
            g <= 'd120;
            b <= 'd135;
        end
		  if(x==0 && y==0)
				begin
				r<=150;
				g<=150;
				b<=150;
				end
    end

	assign red = r;
	assign green = g;
	assign blue = b;
	
endmodule