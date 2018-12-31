class Cannon extends Entity
{
  ArrayList<Box> b = new ArrayList<Box>();

  Cannon(float _x, float _y, PImage _img, boolean _isAlive)
  {
    super(_x, _y, _img, "Cannon", _isAlive);
    super.createBody(BodyType.DYNAMIC, 0);
  }

  void shoot()
  {
    Vec2 pos = box2d.getBodyPixelCoord(super.body);

    if (keyPressed)
    {
      if (key == ' ')
      {
        b.add(new Box(pos.x, pos.y + super.imgH/2, boxImg, true));
      }
    }

    for (int i = 0; i < b.size(); i++)
    {
      b.get(i).display();

      if (b.get(i).done())
      {
        b.remove(i);
      }
    }
  }
}