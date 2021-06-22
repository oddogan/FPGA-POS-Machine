module imageloader(clk, x, y, red, green, blue);

	input clk;
	
    localparam image_width = 50;
    localparam image_height = 50;
	 parameter first_fruit_x = 'd15;
	 parameter first_fruit_y = 230;
	 parameter next_fruit = 'd80;
	 localparam background_r = 8'h2d;
	 localparam background_g =	8'h78;
	 localparam background_b =	8'h87;
	 
	 integer index = 0;
	 
	 
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
        $readmemh("apple50.txt", apple);
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
		   if(y==0 && y == 0)
				r<=1;
				
		  index = ((y - first_fruit_y) * image_width + (x - first_fruit_x)) * 3;
        if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x && x < image_width + first_fruit_x)
        begin
				//index = ((y - first_fruit_y) * image_width + (x - first_fruit_x)) * 3;
            //$fread(file, "%h %h %h", index, rgb); 
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
        end
		  
		  
		  else if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x + next_fruit && x < image_width + 95)
		  begin 
				//index_2 = ((y - first_fruit_y ) * image_width + (x - first_fruit_x - next_fruit)) * 3;
				
				r <= apple[index-80];
				g <= apple[index-79];
				b <= apple[index-78];
					
				
		  end
		  
		  else if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x + 2*next_fruit && x < image_width + 175)
		  begin 
				//index_3 = ((y - first_fruit_y ) * image_width + (x - first_fruit_x - 2*next_fruit)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= first_fruit_y && y < image_height + first_fruit_y && x>= first_fruit_x + 3*next_fruit && x < image_width + 255)
		  begin 
				//index = ((y - first_fruit_y ) * image_width + (x - first_fruit_x - 3*next_fruit)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= 310 && y < image_height +310 && x>= first_fruit_x  && x < image_width + first_fruit_x )
		  begin 
				//index = ((y - 310 ) * image_width + (x - first_fruit_x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>=310 && y < image_height + 310 && x>= 95 && x < image_width + 95)
		  begin 
				//index = ((y - 310 ) * image_width + (x - 95)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= 310 && y < image_height + 310 && x>= 175 && x < image_width + 175)
		  begin 
				//index_7 = ((y - 310 ) * image_width + (x - 175)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= 310 && y < image_height + 310 && x>= 255 && x < image_width + 255)
		  begin 
				//index_8 = ((y - 310) * image_width + (x - 255)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= 390 && y < image_height + 390 && x>= first_fruit_x  && x < image_width + first_fruit_x )
		  begin 
				//index_9 = ((y - 390 ) * image_width + (x - first_fruit_x)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= 390 && y < image_height + 390 && x>= 95 && x < image_width + 95)
		  begin 
			   //index_10 = ((y - 390 ) * image_width + (x - 95)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= 390 && y < image_height + 390 && x>= 175 && x < image_width + 175)
		  begin 
				//index_11 = ((y - 390 ) * image_width + (x - 175)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  
		  else if (y>= 390 && y < image_height + 390 && x>= 255 && x < image_width + 255)
		  begin	
				//index_12 = ((y - 390 ) * image_width + (x - 255)) * 3;
				
				r <= apple[index];
				g <= apple[index+1];
				b <= apple[index+2];
					
				
		  end
		  /*
			else if (x>=340 && x<620 && y>= 60 && y< 440)  //cart part
				begin
					if ((y>=108 && y < 110 ) || y<63 || y > 436 || (y   >= 148 && y < 150))
						begin 
							r <= 0; g <= 0; b <= 0;
						end
						
					else if (x < 343 || x > 616 || (y >= 110&& x > 480 && x < 483 ) || (y >= 110&& x > 530 && x < 533) )
						begin
							r <= 0; g <= 0; b <= 0;
						end
					else if(y==174 || y == 198 || y==222 || y == 246 || y==270 || y == 294 || y==318 || y == 342 || y==366 || y == 390 || y==414)
						begin
							r <= 0; g <= 0; b <= 0;
						end
					else
						begin
							r <= 255; g <= 255; b <= 255;
						end
				end*/
		  
        else
				begin
					r <= background_r;
					g <= background_g;
					b <= background_b;
				end
				
			
		  if( x>=10 && x< 110 && y >= 60 && y < 160) // logo part
				begin
					r <= 8'd200;
					g <= 8'd100;
					b <= 8'd100;
				end
				
			else if( x>=120 && x< 220 && y >= 60 && y < 109) // code and qty part
				begin 
					r <= 8'd100;
					g <= 8'd200;
					b <= 8'd100;
				end
				
			else if( x>=120 && x< 220 && y >= 111 && y < 160) // code and qty part
				begin 
					r <= 8'd100;
					g <= 8'd200;
					b <= 8'd100;
				end
				
				
			else if( x>= 130 && x< 330 && y >= 60 && y < 160) // total price part
				begin
					r <= 8'd100;
					g <= 8'd100;
					b <= 8'd200;
				end
				
    end

	assign red = r;
	assign green = g;
	assign blue = b;
	
endmodule