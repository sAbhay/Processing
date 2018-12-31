class Target extends Entity
{
  PVector moveSpeed;

  Target(float _x, float _y, PImage _img, boolean _isAlive)
  {
    super(_x, _y, _img, "Target", _isAlive);
    super.createBody(BodyType.DYNAMIC, 0, 10);

    moveSpeed = new PVector(100, 0);
  }
}