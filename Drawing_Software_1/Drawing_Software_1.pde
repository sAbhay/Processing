float c;
float angle;

void setup()
{
  fullScreen();
  rectMode(CENTER);
}

void draw()
{ 
  translate(mouseX, mouseY);

  if (keyPressed)
  {
    if (key==' ')
    {
      c = angle;
      rotate(c);
      angle++;

      for (int x = 30; x > 0; x--)
      {
        stroke(random(255), random(255), random(255));
        ellipse(30, 30, x, x);
        stroke(random(255), random(255), random(255));
        rect(50, 50, x, x);
      }
    }
  }

  if (mousePressed)
  {
    if (mouseButton==RIGHT)
    {
      for (int x = 30; x > 0; x--)
      {
        stroke(random(255), random(255), random(255));
        ellipse(0, 0, x, x);
      }
    }

    if (mouseButton==LEFT)
    {
      for (int x = 30; x > 0; x--)
      {
        stroke(random(255), random(255), random(255));
        rect(0, 0, x, x);
      }
    }
  }
}

void keyPressed()
{
  if (key=='r')
  {
    background(0);
    delay(20);
    background(255);
  }
}