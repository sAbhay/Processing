class Ball
{
  PVector pos;
  PVector vel;

  float rad;
  float m;
  float speed;

  Ball(PVector start, PVector target)
  {
    pos = new PVector(_player.x, _player.y);
    vel = new PVector(_target.x, _target.y);

    vel = PVector.sub(_player, _target);

    vel.normalize();
    vel.mult(speed);
  }

  public void resolveCollision(Ball ball)
  {
    // get the mtd
    PVector delta = (pos.sub(ball.pos));
    float d = delta.mag();
    // minimum translation distance to push balls apart after intersecting
    PVector mtd = delta.mult(((getRadius() + ball.getRadius())-d)/d); 


    // resolve intersection --
    // inverse mass quantities
    float im1 = 1 / getMass(); 
    float im2 = 1 / ball.getMass();

    // push-pull them apart based off their mass
    pos = pos.add(mtd.mult(im1 / (im1 + im2)));
    ball.pos = ball.pos.sub(mtd.mult(im2 / (im1 + im2)));

    // impact speed
    PVector v = (this.vel.sub(ball.vel));
    float vn = v.dot(mtd.normalize());

    // sphere intersecting but moving away from each other already
    if (vn > 0.0f) return;

    // collision impulse
    float i = (-(1.0f + restitution) * vn) / (im1 + im2);
    PVector impulse = mtd.mult(i);

    // change in momentum
    this.vel = this.vel.add(impulse.mult(im1));
    ball.vel = ball.vel.sub(impulse.mult(im2));
  }
  
  public float getRadius()
  {
   return rad; 
  }
  
  public float getMass()
  {
   return m; 
  }
}