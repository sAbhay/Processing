class Boundary extends Entity
{
  Boundary(float _x, float _y, PImage _img, boolean _isAlive)
  {
    super(_x, _y, _img, "Platform", _isAlive);
    super.createBody(BodyType.STATIC, 0, 1000);
  }
}