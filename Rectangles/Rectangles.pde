boolean hsb = false;

void setup()
{
  fullScreen(P2D);
  background(0);
  rectMode(CENTER);
}

void draw()
{
  for (int i = 0; i < 50; i++)
  {
    noStroke();

    if (hsb)
    {
      colorMode(HSB);
      fill(random(255), 255, 255, 4);
    } else 
    {
      colorMode(RGB);
      fill(random(255), random(255), random(255), 4);
    }

    rect(random(width), random(height), random(50), random(50));
  }
}

void mousePressed()
{
  if (hsb) 
  { 
    hsb = false; 
    background(0);
  } else if (!hsb) 
  {
    hsb = true; 
    background(0);
  }
}