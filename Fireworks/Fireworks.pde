ArrayList<particle> p = new ArrayList<particle>();

void setup()
{
  fullScreen(P2D);
}

void draw()
{
  background(0);
  
  if(mousePressed)
    {
     p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5))); 
    }
  
  for (int j = 0; j < p.size() - 1; j++)
  {
    p.get(j).update();

    if (keyPressed)
    {
      if (key == 'r')
      {
        p.get(j).kill = true;
      }

      if (p.get(j).kill)
      {
        p.remove(j);
      }
    }

    /*if (j > 300)
    {
      j = 300;

      p.get(j).kill = true;

      if (p.get(j).kill)
      {
        p.remove(j);
      }
    }*/
  }
}