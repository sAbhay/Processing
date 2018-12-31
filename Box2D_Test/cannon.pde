class Cannon extends Entity
{
  ArrayList<Box> b = new ArrayList<Box>();

  PVector moveSpeed;
  boolean leftPressed = false;
  boolean rightPressed = false;
  boolean jump;

  Cannon(float _x, float _y, PImage _img, boolean _isAlive)
  {
    super(_x, _y, _img, "Cannon", _isAlive);
    super.createBody(BodyType.DYNAMIC, 0, 1);

    moveSpeed = new PVector(25, 0);
  }

  void shoot()
  {
    Vec2 pos = box2d.getBodyPixelCoord(super.body);

    if (keyPressed)
    {
      if (key == ' ')
      { 
        if (b.size() < 1)
        {
          b.add(new Box(pos.x + super.imgW/2, pos.y - super.imgH/2.5, cannonBallImg, true));
        }
      }
    }

    for (int i = 0; i < b.size(); i++)
    {
      b.get(i).display();
      b.get(i).shot();

      if (b.get(i).done())
      {
        b.remove(i);
      }
    }
  }

  void move()
  {
    if (keyPressed)
    {
      if (key == 'a')
      {
        leftPressed = true;
      }

      if (key == 'd')
      {
        rightPressed = true;
      }
    } else 
    {
      leftPressed = false;
      rightPressed = false;
    }

    //Vec2 pos = box2d.getBodyPixelCoord

    if (rightPressed)
    {
    }
  }
}