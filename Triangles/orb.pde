class Orb
{
  PVector pos;
  PVector vel;
  PVector dir;

  Orb()
  {
    pos = new PVector(random(width), random(height));
    vel = new PVector();

    if ((int) random(2) == 0)
    {
      vel.x = random(3, 6);
    } else
    {
      vel.x = random(-6, -3);
    }

    if ((int) random(2) == 0)
    {
      vel.y = random(3, 6);
    } else
    {
      vel.y = random(-6, -3);
    }
  }

  void display()
  {
    fill(255);
    ellipse(pos.x, pos.y, 10, 10);
  }

  void move(PVector _start, PVector _target)
  {
    pos = new PVector(_start.x, _start.y, _start.z); // _start determines the spawn point
    dir = new PVector(_target.x, _target.y, _target.z); // _target determines target

    dir = PVector.sub(_start, _target); // causes the bullet to move at angle based on its target's relative position from the spawn point

    dir.normalize();
    dir.mult(10);

    if (mousePressed)
    {
      if (mouseButton == LEFT)
      {
        pos.add(dir);
      } else if (mouseButton == RIGHT)
      {
        pos.sub(dir);
      }
    } else
    {
      pos.add(vel);
    }

    checkBoundaries();
  }

  void checkBoundaries()
  {
    if (pos.x <= 0)
    {
      pos.x = 0;
      vel.x *= -1;
    }

    if (pos.x >= width)
    {
      pos.x = width;
      vel.x *= -1;
    }

    if (pos.y <= 0)
    {
      pos.y = 0;
      vel.y *= -1;
    }

    if (pos.y >= height)
    {
      pos.y = height;
      vel.y *= -1;
    }
  }

  void update(PVector _start, PVector _target)
  {
    move(_start, _target);
    display();
  }
}