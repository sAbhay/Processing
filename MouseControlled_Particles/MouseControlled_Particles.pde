float attractionSpeed = 3;

ArrayList<Entity> stars = new ArrayList<Entity>();
ArrayList<Entity> planets = new ArrayList<Entity>();

PVector center;

int numberOfParticles = 5000;

PVector[] spawn = new PVector[numberOfParticles];

void setup()
{
  fullScreen(P3D);

  center = new PVector(width/2, height/2);

  for (int i = 0; i < numberOfParticles; i++)
  {
    spawn[i] = new PVector(random(width), random(height), 0);
    stars.add(new Entity(spawn[i], center, 3, color(255)));
  }
}

void draw()
{
  background(0);
  
  center = new PVector(mouseX, mouseY, 0);
  
  for(int i = 0; i < stars.size(); i++)
  {
   stars.get(i).display();
   
   PVector mouse = new PVector(mouseX, mouseY);
   stars.get(i).move(spawn[i], mouse);
  }
  
  pushMatrix();
  fill(0);
  ellipse(0, 0, 25, 25);
  popMatrix();
}