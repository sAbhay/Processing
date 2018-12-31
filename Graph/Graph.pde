float x = 0;
float y;

float px;
float py;

void setup()
{
 fullScreen(P2D); 
 
 background(0);
 
 y = height/2;
}

void draw()
{
  float xPlus = 2;
  
  px = x;
  x+=xPlus;
  
  float yPlus = random(-20, 20);
  
  py = y;
  y += yPlus;
  
  stroke(255);
  line(px, py, x, y);
}