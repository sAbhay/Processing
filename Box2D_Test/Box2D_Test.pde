import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

PImage cannonBallImg;
PImage platformImg;
PImage cannonImg;
PImage targetImg;

ArrayList<Box> b = new ArrayList<Box>();
ArrayList<Target> t = new ArrayList<Target>();

Boundary boundary;

Cannon cannon;

Target target;

void setup()
{
  fullScreen();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  box2d.setContinuousPhysics(true);

  cannonBallImg = loadImage("cannonball.png");
  cannonBallImg.resize(30, 30);

  platformImg = loadImage("platform.png");
  platformImg.resize(width, 40);

  cannonImg = loadImage("cannon.png");
  cannonImg.resize(100, 50);

  targetImg = loadImage("target.png");
  targetImg.resize(100, 100);

  boundary = new Boundary(width/2, height - 20, platformImg, true);
  cannon = new Cannon(200, height/1.1, cannonImg, true);

  t.add(new Target(width - 200, height - height/8, targetImg, true));
}

void draw()
{
  background(255);

  box2d.step();

  for (int i = 0; i < b.size(); i++)
  {
    b.get(i).display();
  }

  for (int i = 0; i < t.size(); i++)
  {
    t.get(i).display();
  }

  boundary.display();
  cannon.display();
  cannon.shoot();
}

void keyPressed()
{
  if (key == 'r')
  {
    t.add(new Target(width - 200, height - height/8, targetImg, true));
  }
}