float space = 80;
float x = 300;

void setup()
{
   fullScreen();
   background(0);
   
   frameRate(30);
}

void draw()
{
  textSize(128);
  
  stroke(random(255), random(255), random(255));
  strokeWeight(8);
  line(x - 5, height/2 + 20, x + space*11 - 15, height/2 + 20);
  
  fill(random(255), random(255), random(255));
  text("F", x, height/2);
  
  fill(random(255), random(255), random(255));
  text("i", x + space + 20, height/2);
  
  fill(random(255), random(255), random(255));
  text("r", x + space*2, height/2);
  
  fill(random(255), random(255), random(255));
  text("s", x + space*3, height/2);
  
  fill(random(255), random(255), random(255));
  text("t", x + space*4, height/2);
  
  fill(random(255), random(255), random(255));
  text("D", x + space*6, height/2);
  
  fill(random(255), random(255), random(255));
  text("r", x + space*7 + 20, height/2);
  
  fill(random(255), random(255), random(255));
  text("a", x + space*8, height/2);
  
  fill(random(255), random(255), random(255));
  text("f", x + space*9, height/2);
  
  fill(random(255), random(255), random(255));
  text("t", x + space*10, height/2);
}