import queasycam.*;

QueasyCam cam;

Terrain t;

PImage map[] = new PImage[2];

void setup()
{
  fullScreen(P3D);
  
  cam = new QueasyCam(this);
  
  map[0] = loadImage("crackedGround.png");
  map[1] = loadImage("heightMap.png");
  
  t = new Terrain(map[1], 5);
  t.create();
}

void draw()
{
  background(0);
  
  t.display();
  
  println(frameRate);
}