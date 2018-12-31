ArrayList<Particle> p = new ArrayList<Particle>();

void setup()
{
  fullScreen();
  background(0);
  noStroke();
  colorMode(HSB);

  for (int i = 0; i < 10; i++)
  {
    p.add(new Particle(random(width), random(height), random(10, 15), random(10, 15), random(255)));
  }
}

void draw()
{
  fill(0, 50);
  rect(0, 0, width, height);

  for (int i = 0; i < p.size(); i++)
  {
    p.get(i).update();
  }
}