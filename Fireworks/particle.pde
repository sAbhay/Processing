class particle
{
  float x;
  float y;
  float size = random(1, 10);

  float velX = random(-9, 9);
  float velY = random(-9, 9);
  
  float r = random(255);
  float g = random(255);
  float b = random(255);

  boolean kill = false;

  particle()
  {
    x = mouseX;
    y = mouseY;
  }

  particle(float _size, float _velX, float _velY)
  {
    _size = size;
    _velX = velX;
    _velY = velY;

    x = mouseX;
    y = mouseY;
  }
  
  void display()
  {
   fill(r, g, b);
   ellipse(x, y, size, size); 
  }
  
  void checkBoundaries()
  {
    if (x < -100| x > width + 100||y < -100||y > height + 100)
    {
      kill = true;
    }
    
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
  }
  
  void move()
  {
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