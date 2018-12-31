class particle
{
  float x;
  float y;
  float size = 3;

  float velX = random(-9, 9);
  float velY = random(-9, 9);

  float r;
  float g;
  float b;

  boolean kill = false;

  particle()
  {
    x = random(0, width);
    y = height;
    
    if (colourScheme >= 0 && colourScheme < 1)
    {
      r = 0;
      g = random(0, 150);
      b = random(100, 200);
    }
    
    if (colourScheme >= 1 && colourScheme < 2)
    {
      r = 0;
      b = random(0, 150);
      g = random(100, 200);
    }

    if (colourScheme >= 2 && colourScheme < 3)
    {
      b = 0;
      r = random(0, 150);
      g = random(100, 200);
    }

    if (colourScheme >= 3 && colourScheme < 4)
    {
      b = 0;
      g = random(0, 150);
      r = random(100, 200);
    }
    
    if (colourScheme >= 4 && colourScheme < 5)
    {
      g = 0;
      b = random(0, 150);
      r = random(100, 200);
    }
    
    if (colourScheme >= 5 && colourScheme < 6)
    {
      g = 0;
      r = random(0, 150);
      b = random(100, 200);
    }
  }

  void display()
  {
    fill(r, g, b);
    noStroke();
    ellipse(x, y, size, size);
  }

  void checkBoundaries()
  { 
    /*if (x < 0)
     {
     x = 0;
     velX *= -1;
     }
     
     if (x > width)
     {
     x = width;
     velX *= -1;
     }
     
     if (y < 0)
     {
     y = 0;
     velY *= -1;
     }
     
     if (y > height)
     {
     y = height;
     velY *= -1;
     }*/

    if (x < -20| x > width + 20||y < 0||y > height + 10)
    {
      kill = true;
    }
  }

  void move()
  {
    velX = random(-5, 5);
    velY = random(-10, -1);

    x += velX;
    y += velY;
  }

  void update()
  {
    display();
    checkBoundaries();
    move();
  }
}