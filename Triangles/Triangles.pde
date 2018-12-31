ArrayList<Orb> o = new ArrayList<Orb>();

float h;

void setup()
{
  fullScreen(P3D);

  for (int i = 0; i < 30; i++)
  {
    o.add(new Orb());
  }

  noStroke();

  colorMode(HSB);
}

void draw()
{
  //h = (h + 1) % 255;

  background(0);

  for (int i = 0; i < o.size(); i++)
  {
    o.get(i).move(o.get(i).pos, new PVector(mouseX, mouseY));

    PVector p1 = new PVector(o.get(i).pos.x, o.get(i).pos.y);
    PVector p2 = p1;
    PVector p3 = p2;
    
    for (int j = 0; j < o.size(); j++)
    {
      if (i != j)
      { 
        if (dist(o.get(i).pos.x, o.get(i).pos.y, o.get(j).pos.x, o.get(j).pos.y) < 300)
        {
          if (p2 != p1)
          {
            p3 = new PVector(o.get(j).pos.x, o.get(j).pos.y);
          } else
          {
            p2 = new PVector(o.get(j).pos.x, o.get(j).pos.y);
          }

          if (p1 != p2 && p1 != p3 && p2 != p3)
          {
            fill(p1.x/width * 255, 255, 255, 50);
            //fill(h, 255, 255, 50);
            triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
          }
        }
      }
    }
  }
}