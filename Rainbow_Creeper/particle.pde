class particle
{
  float x;
  float y;
  float size = 3;

  float velX;
  float velY;

  float h;

  boolean kill = false;

  particle(float _h)
  {
    x = random(0, width);
    y = height;
    
    h = _h;
  }

  void display()
  {
    /*if (millis() > 10000)
    {
      fill(0, random(255), random(255));
    } 
    
    else
    {
      fill(h, 255, 255);
    }*/


    strokeWeight(0.1);
    fill(h, 255, 255);
    ellipse(x, y, size, size);

    //h += 1.375;

    
  }

  void checkBoundaries()
  { 
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