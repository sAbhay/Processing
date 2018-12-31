void setup()
{
  size(1000, 800);
  rectMode(CENTER);
}

void draw()
{ 
  for (int x = 0; x < 121; x++)
  {
    for (int y = 0; y < 81; y++)
    {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
      rect(x*10, y*10, 10, 10);
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
      ellipse(x*10, y*10, 5, 5);
    }
  }
}