class Mover
{
  float x;
  float y;

  float velX;
  float velY;

  float size;

  float r;
  float g;
  float b;

  int reflectType;

  Mover(float _x, float _y, float _velX, float _velY, float _size, int _reflectType, int _colourScheme)
  {
    x = _x;
    y = _y;

    velX = _velX;
    velY = _velY;

    size = _size; 

    reflectType = _reflectType;

    colourScheme = _colourScheme;

    if (colourScheme == 0)
    {
      r = 0;
      g = random(0, 150);
      b = random(100, 200);
    }

    if (colourScheme == 1)
    {
      r = 0;
      b = random(0, 150);
      g = random(100, 200);
    }

    if (colourScheme == 2)
    {
      b = 0;
      r = random(0, 150);
      g = random(100, 200);
    }

    if (colourScheme == 3)
    {
      b = 0;
      g = random(0, 150);
      r = random(100, 200);
    }

    if (colourScheme == 4)
    {
      g = 0;
      b = random(0, 150);
      r = random(100, 200);
    }

    if (colourScheme == 5)
    {
      g = 0;
      r = random(0, 150);
      b = random(100, 200);
    }
  }

  void display()
  {
    fill(r, g, b);
    //fill(random(256), random(256), random(256));
    ellipse(x, y, size, size);
  }

  void move()
  {
    x += velX;
    y -= velY;
  }

  void checkBoundaries()
  {
    if (reflectType == 0)
    {
      if (x > width || x < 0)
      {
        velX *= -1;
      }

      if (y > height || y < 0)
      {
        velY *= -1;
      }
    }

    if (reflectType == 1)
    {
      if (x > width)
      {
        x = 0;
      }

      if (y < 0)
      {
        y = height;
      }

      if (y > height)
      {
        y = 0;
      }

      if (y < 0)
      {
        y = height;
      }
    }
  }

  void update()
  {
    display();
    move();
    checkBoundaries();
  }
}