class Ball
{
  float pos;
  float vel;
  float r = 10;
  color col;

  Ball(float p, float v, color c)
  {
    pos = p;
    vel = v;
    col = c;
  }

  void display()
  {
    fill(col);
    ellipse(pos, height/2, r, r);
  }

  void move()
  {
    pos += vel;
  }

  void update()
  {
    move();
    display();
  }

  boolean checkCollision(Ball b)
  {
    if (abs(pos - b.pos) < r)
    {
      vel *= -1;
      b.vel *= -1;

      return true;
    }
    return false;
  }
}