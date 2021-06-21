module imageloader(clk, x, y, red, green, blue);

	input clk;
	
    localparam image_width = 70;
    localparam image_height = 70;
	 localparam first_fruit_x = 320;
	 localparam first_fruit_y = 240;
	 localparam next_fruit = 80;
	 
	 integer index = 0;
	 integer file;

    // Coordinates in the display
    input [9:0] x, y;

    // The RGB values in the corresponding pixel
    reg [7:0] r, g, b;
	 output [7:0] red, green, blue;
    reg [7:0] apple [0:3*(image_width*image_height)-1];
	 /*/reg [7:0] banana [0:3*(image_width*image_height)-1];
	 reg [7:0] brocoli [0:3*(image_width*image_height)-1];
	 reg [7:0] carrot [0:3*(image_width*image_height)-1];
	 reg [7:0] cherry [0:3*(image_width*image_height)-1];
	 reg [7:0] cucumber [0:3*(image_width*image_height)-1];
	 reg [7:0] peach [0:3*(image_width*image_height)-1];
	 reg [7:0] pineapple [0:3*(image_width*image_height)-1];
	 reg [7:0] potato [0:3*(image_width*image_height)-1];
	 reg [7:0] strawberry [0:3*(image_width*image_height)-1];
	 reg [7:0] tomato [0:3*(image_width*image_height)-1];
	 reg [7:0] watermelon [0:3*(image_width*image_height)-1];
	 reg [7:0] rgb [0:2];*/
	 
	 
    initial
	 begin
			//file = $fopenr("facebook.txt");
        $readmemh("apple.txt", apple);
		  //$readmemh("banana.txt", banana);
		  //$readmemh("brocoli.txt", brocoli);
		  //$readmemh("carrot.txt", carrot);
		  //$readmemh("cherry.txt", cherry);
		  //$readmemh("cucumber.txt", cucumber);
		  //$readmemh("peach.txt", peach);
		  //$readmemh("pineapple.txt", pineapple);
		  //$readmemh("potato.txt", potato);
		  //$readmemh("strawberry.txt", strawberry);
		  //$readmemh("tomato.txt", tomato);
		 // $readmemh("watermelon.txt", watermelon);
		  
		  
		  
	 end


	 
    always @(posedge clk)
    begin
			
			
        if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x && x < image_width + first_fruit_x)
        begin
				index = ((y - first_fruit_y) * image_width + (x - first_fruit_x)) * 3;
            //$fread(file, "%h %h %h", index, rgb); 
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
        end
		  
		  
		  else if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x + next_fruit && x < image_width + first_fruit_x + next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x + 2*next_fruit && x < image_width + first_fruit_x + 2*next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x + 3*next_fruit && x < image_width + first_fruit_x + 3*next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + next_fruit && y < image_height + first_fruit_y + next_fruit && x>= first_fruit_x  && x < image_width + first_fruit_x )
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + next_fruit && y < image_height + first_fruit_y + next_fruit && x>= first_fruit_x + next_fruit && x < image_width + first_fruit_x + next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + next_fruit && y < image_height + first_fruit_y + next_fruit && x>= first_fruit_x + 2*next_fruit && x < image_width + first_fruit_x + 2*next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + next_fruit && y < image_height + first_fruit_y + next_fruit && x>= first_fruit_x + 3*next_fruit && x < image_width + first_fruit_x + 3*next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + 2*next_fruit && y < image_height + first_fruit_y + 2*next_fruit && x>= first_fruit_x  && x < image_width + first_fruit_x )
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + 2*next_fruit && y < image_height + first_fruit_y + 2*next_fruit && x>= first_fruit_x + next_fruit && x < image_width + first_fruit_x + next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + 2*next_fruit && y < image_height + first_fruit_y + 2*next_fruit && x>= first_fruit_x + 2*next_fruit && x < image_width + first_fruit_x + 2*next_fruit)
		  begin 
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y + 2*next_fruit && y < image_height + first_fruit_y + 2*next_fruit && x>= first_fruit_x + 3*next_fruit && x < image_width + first_fruit_x + 3*next_fruit)
		  begin	
				index = ((y) * image_width + (x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  
        else
				begin
					r <= 'd45;
					g <= 'd120;
					b <= 'd135;
				end
		  if(x==0 && y==0)
				r<=1;
				
    end

	assign red = r;
	assign green = g;
	assign blue = b;
	
endmodule