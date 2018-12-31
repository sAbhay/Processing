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
    x = width/2;
    y = height/2;
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
     x = width;
     }
     
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

    /*if (x < -20| x > width + 20||y < 0||y > height + 10)
    {
      kill = true;
    }*/
  }

  void move()
  {
    velX = random(-5, 5);
    velY = random(-5, 5);

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