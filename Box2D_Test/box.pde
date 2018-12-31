class Box extends Entity
{
  PVector moveSpeed;

  Box(float _x, float _y, PImage _img, boolean _isAlive)
  {
    super(_x, _y, _img, "Box", _isAlive);
    super.createBody(BodyType.DYNAMIC, 0, 10);

    moveSpeed = new PVector(400, 20);
  }

  void shot()
  {
    Vec2 currentVelocity = super.body.getLinearVelocity();

    currentVelocity.x = 1 * moveSpeed.x;
    currentVelocity.y = 0.1 * moveSpeed.y;

    super.body.setLinearVelocity(currentVelocity);
  }
}