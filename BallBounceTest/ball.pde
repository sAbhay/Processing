class Ball
{
  PVector pos;
  PVector vel;

  float m;
  float r;

  Ball(float x, float y, float _m, float _r)
  {
    pos = new PVector(x, y);
    vel = new PVector(random(-10, 10), random(-10, 10));

    m = _m;
    r = _r;
  }

  void display()
  {
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }

  void move()
  {
    pos.add(vel);
  }

  void checkCollision(Ball b) {

    if (dist(pos.x, pos.y, b.pos.x, b.pos.y) < (r + b.r))
    {
      vel.x = vel.y = b.vel.x = b.vel.y = 0;
      
      PVector a = new PVector();
      a = PVector.sub(pos, b.pos);
      PVector o = new PVector(-a.x, -a.y);
      
      a.normalize();
      o.normalize();

      vel.x = a.x;
      vel.y = a.y;

      b.vel.x = o.x;
      b.vel.y = o.y;
    }
  }

  void checkBoundaries()
  {
    if (pos.x <= r)
    {
      pos.x = r;
      vel.x *= -1;
    }

    if (pos.y <= r)
    {
      pos.y = r;
      vel.y *= -1;
    }

    if (pos.x >= width - r)
    {
      pos.x = width - r;
      vel.x *= -1;
    }

    if (pos.y >= height - r)
    {
      pos.y = height - r;
      vel.y *= -1;
    }
  }

  void update()
  {
    display();
    move();
    checkBoundaries();
  }
}