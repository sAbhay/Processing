class Player
{
  float x;
  float y;
  float velX = 0;
  float velY = 0;
  
  int r;
  int g;
  int b;

  void initialize()
  {
    noStroke();
    fill(r, g, b);
    fill(255, 128, 0);
    ellipse(x, y, 50, 50);
    
    x += velX;
    y -= velY;
    
    if(velX > 15)
    {
      velX = 15;
    }
    
    if(velY > 15)
    {
     velY = 15; 
    }
    
    velX *= 0.975;
    velY *= 0.975;
    
    checkBoundaries();
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
}