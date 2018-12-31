
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

PImage boxImg;
PImage platformImg;
PImage cannonImg;

ArrayList<Box> b = new ArrayList<Box>();

Boundary boundary;

Cannon cannon;

void setup()
{
  fullScreen();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  box2d.setContinuousPhysics(true);

  boxImg = loadImage("box.png");
  boxImg.resize(30, 30);

  platformImg = loadImage("platform.png");
  platformImg.resize(width, 40);
  
  cannonImg = loadImage("cannon.png");
  cannonImg.resize(100, 50);

  boundary = new Boundary(width/2, height - 20, platformImg, true);
  cannon = new Cannon(200, 60, cannonImg, true);
}

void draw()
{
  background(255);

  box2d.step();

  for (int i = 0; i < b.size(); i++)
  {
    b.get(i).display();
    
    if(b.get(i).done())
    {
     b.remove(i); 
    }
  }

  boundary.display();
  cannon.display();
  cannon.shoot();
}