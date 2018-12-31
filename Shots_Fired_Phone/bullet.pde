class bullet
{
  float size;

  PVector pos;
  PVector dir;
  float speed;

  boolean kill;

  bullet()
  {
    size = 20;

    pos = new PVector(0, 0);
    dir = new PVector(0, 0);
    speed = 2;
  }

  void spawn()
  {
    fill(255);
    ellipse(pos.x, pos.y, size, size);

    if (pos.x < -100| pos.x > width + 100||pos.y < -100||pos.y > height + 100)
    {
      kill = true;
    }
  }

  void move()
  {
    pos.add(dir);
  }

  bullet(PVector _player, PVector _target)
  {
    pos = new PVector(_player.x, _player.y);
    dir = new PVector(_target.x, _target.y);

    dir = PVector.sub(_player, _target);

    speed = random(30, 60);
    size = 20;

    dir.normalize();
    dir.mult(speed);
  }

  void update()
  {
    move();
    spawn();
  }
}