class particle
{
  float x;
  float y;
  float size = random(1, 10);

  float velX = random(-9, 9);
  float velY = random(-9, 9);

  boolean kill = false;

  particle()
  {
    x = player1.x;
    y = player1.y;
  }

  particle(float _size, float _velX, float _velY)
  {
    _size = size;
    _velX = velX;
    _velY = velY;

    if (screenState == 2)
    {
      x = randomPlayer1.x;
      y = randomPlayer1.y;
    } else {
      x = player1.x;
      y = player1.y;
    }
  }

  void display()
  {
    fill(255, 128, 0);
    ellipse(x, y, size, size);
  }

  void checkBoundaries()
  {
    if (x < -100| x > width + 100||y < -100||y > height + 100)
    {
      kill = true;
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
    move();
    checkBoundaries();
  }
}