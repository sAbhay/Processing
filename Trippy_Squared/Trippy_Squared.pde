void setup()
{
  fullScreen(); 
  rectMode(CENTER);
}

void draw()
{
  background(0);
  for (int x = 0; x < 37; x++)
  {
    for (int y = 0; y < 23; y++)
    {
      for (int z = 30; z > 0; z--)
      {
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
        rect(x*40, y*40, z, z);
      }
    }
  }
}