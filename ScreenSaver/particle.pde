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
    x = random(0, width);;
    y = random(0, height);;
  }

  particle(float _size, float _velX, float _velY)
  {
    _size = size;
    _velX = velX;
    _velY = velY;

    x = random(0, width);
    y = random(0, height);
  }
  
  void display()
  {
   fill(r, g, b);
   noStroke();
   ellipse(x, y, size, size); 
  }
  
  void checkBoundaries()
  { 
    if (x < 0)
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
    }
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