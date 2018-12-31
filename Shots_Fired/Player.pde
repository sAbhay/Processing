class Player
{
  float x;
  float y;
  float velX = 0;
  float velY = 0;

  int r;
  int g;
  int b;

  float size = 50;

  void initialize()
  {
    noStroke();
    fill(r, g, b);
    fill(255, 128, 0);
    ellipse(x, y, size, size);

    x += velX;
    y -= velY;

    if (velX > 15)
    {
      velX = 15;
    }

    if (velY > 15)
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

  void right()
  {
    velX+=0.875;
  }

  void left()
  {
    velX-=0.875;
  }

  void up()
  {
    velY+=0.875;
  }

  void down()
  {
    velY-=0.875;
  }

  void mouseMove()
  {
    x += mouseX - pmouseX;
    y += mouseY - pmouseY;
  }
}