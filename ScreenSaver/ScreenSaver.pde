ArrayList<particle> p = new ArrayList<particle>();

void setup()
{
  fullScreen(P2D);
}

void draw()
{
  fill(0, 50);
  rect(0, 0, width, height);

  p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5))); 

  for (int j = 0; j < p.size() - 1; j++)
  {
    p.get(j).update();

    if (j > 1000)
    {
      p.get(j-1000).kill = true;

      if (p.get(j-1000).kill)
      {
        p.remove(j-1000);
      }
    }
  }
}

void mousePressed()
{
 exit(); 
}