void setup()
{
  size(700, 700);
  rectMode(CENTER);
}

void draw()
{ 
  for (int x = 0; x < 71; x++)
  {
    for (int y = 0; y < 71; y++)
    {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
      rect(x*10, y*10, 10, 10);
      ellipse(x*10, y*10, 5, 5);
    }
  }
}