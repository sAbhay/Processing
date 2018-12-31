float attractionSpeed = 3;

ArrayList<Entity> stars = new ArrayList<Entity>();
ArrayList<Entity> planets = new ArrayList<Entity>();

PVector center;

int numberOfStars = 5000;

void setup()
{
  fullScreen(P3D);
  colorMode(HSB);

  center = new PVector(width/2, height/2, -500);

  for (int i = 0; i < numberOfStars; i++)
  {
    PVector spawn = new PVector(random(width), random(0 - (width - height)/2, height + (width - height)/2), 0);
    stars.add(new Entity(spawn, center, 3, color(255, 0, 255)));
  }
}

void draw()
{
  background(0);
  
  for(int i = 0; i < stars.size(); i++)
  {
   stars.get(i).display();
   stars.get(i).move();
  }
  
  pushMatrix();
  fill(0);
  ellipse(0, 0, 25, 25);
  popMatrix();
}