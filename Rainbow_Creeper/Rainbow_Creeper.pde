ArrayList<particle> p = new ArrayList<particle>();
float h = 0;

void setup()
{
  fullScreen(P2D);
  colorMode(HSB);
}

void draw()
{
  fill(0, 25);
  rect(0, 0, width, height);

  //h += 1.375;
  //h += 0.5;
  h += 1.5;

  if (h > 255)
  {
    h = 0;
  }

  for (int i = 0; i < 100; i++)
  {    
    p.add(new particle(h));
  }

  for (int j = 0; j < p.size(); j++)
  {
    p.get(j).update();

    if (p.get(j).kill)
    {
      p.remove(j);
    }
  }
}