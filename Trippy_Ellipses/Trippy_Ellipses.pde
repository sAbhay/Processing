void setup()
{
  fullScreen();
}

void draw()
{
  for (int a = 0; a < 216; a++)
  {
    for (int b = 0; b < 91; b++)
    {
        stroke(random(255),random(255),random(255));
        fill(random(255),random(255),random(255));
        ellipse(a*10, b*10, 20, 20);
    }
  }
}