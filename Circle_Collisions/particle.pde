class Particle
{
  PVector pos;
  PVector dir;
  float size;
  float speed;

  Particle(PVector _start, PVector _target, float _size, float _speed)
  {
    size = _size;
    speed = _speed;

    pos = new PVector(_start.x, _start.y);
    dir = new PVector(_target.x, _target.y);

    dir = PVector.sub(_target, _start);
    dir.normalize();
    dir.mult(speed);
  }

  private void display()
  {
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }

  private void move()
  {
    pos.add(dir);
  }

  private void checkBoundaries()
  {
    if(pos.x <= size/2 || pos.x >= width - size/2)
    {
     dir.x *= -1; 
    }
    
    if(pos.y <= size/2 || pos.y >= height - size/2)
    {
      dir.y *= -1;
    }
  }

  public void update()
  {
    display();
    move();
    checkBoundaries();
  }
}