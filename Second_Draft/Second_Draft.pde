float space = 80;
float x = 300;
int h = 0;

void setup()
{
   fullScreen();
   background(0);
   
   frameRate(60);
   colorMode(HSB);
}

void draw()
{
  textSize(128);
  
  stroke(0, 0, 0);
  strokeWeight(8);
  line(x - 5, height/2 + 20, x + space*11 - 15, height/2 + 20);
  
  fill((h + 10) % 255, 255, 255);
  text("F", x, height/2);
  
  fill((h + 20) % 255, 255, 255);
  text("i", x + space + 20, height/2);
  
  fill((h + 30) % 255, 255, 255);
  text("r", x + space*2, height/2);
  
  fill((h + 40) % 255, 255, 255);
  text("s", x + space*3, height/2);
  
  fill((h + 50) % 255, 255, 255);
  text("t", x + space*4, height/2);
  
  fill((h + 60) % 255, 255, 255);
  text("D", x + space*6, height/2);
  
  fill((h + 70) % 255, 255, 255);
  text("r", x + space*7 + 20, height/2);
  
  fill((h + 80) % 255, 255, 255);
  text("a", x + space*8, height/2);
  
  fill((h + 90) % 255, 255, 255);
  text("f", x + space*9, height/2);
  
  fill((h + 100) % 255, 255, 255);
  text("t", x + space*10, height/2);
  
  h = h + 1 % 255;
}