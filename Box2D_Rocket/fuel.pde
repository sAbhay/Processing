class Box extends Entity
{
 Box(float _x, float _y, PImage _img, boolean _isAlive)
 {
  super(_x, _y, _img, "Box", _isAlive);
  super.createBody(BodyType.DYNAMIC, 0.1);
 }
}