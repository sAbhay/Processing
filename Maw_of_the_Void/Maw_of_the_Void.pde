//Abhay Singhal

void setup()
{
  fullScreen();
  rectMode(CENTER);
  colorMode(HSB);
}

void draw()
{
  background(0);
  
  for (int x = 0; x < 150; x++)
    {
      for (int y = 0; y < 150; y++)
      {
        for (int z = 0; z < 10; z++)
        {
          stroke(random(255), random(255), random(255));
          fill(x * 1.7, 255, 255);
          ellipse(x*z*10, y*z*10, z*x*y/10, z*y*x/10);
        }
      }
    }
  }