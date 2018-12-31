class particle
{
  float x;
  float y;
  float z;
  float size = random(1, 4);

  float velX = random(-5, 5);
  float velY = random(-5, 5);
  float velZ = random(-5, 5);

  boolean kill = false;

  particle()
  {
    x = player1.x;
    y = player1.y;
    z = player1.z;
  }

  particle(float _size, float _velX, float _velY)
  {
    _size = size;
    _velX = velX;
    _velY = velY;

      x = player1.x;
      y = player1.y;
      z = player1.z;
  }

  void display()
  { 
    pushMatrix();
    
    translate(x, y, z);
    stroke(255, 128, 0);
    fill(255, 128, 0);
    sphere(size);
    
    popMatrix();
  }

  void checkBoundaries()
  {
    if (x < -100| x > width + 100||y < -100||y > height + 100||z > 500||z < -500)
    {
      kill = true;
    }
  }

  void move()
  {
    x += velX;
    y += velY;
    z += velZ;
  }

  void update()
  {
    display();
    move();
    checkBoundaries();
  }
}