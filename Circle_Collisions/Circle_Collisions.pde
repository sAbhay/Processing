ArrayList<Particle> p = new ArrayList<Particle>();

void setup()
{
  fullScreen();
}

void draw()
{
  PVector start = new PVector(mouseX, mouseY);
  PVector target = new PVector(random(width), random(height));
  
  if(p.size() < 100000)
  {
    for(int i = 0; i < 1; i++)
    {
  p.add(new Particle(start, target, 20, 10));
  }
  }
  
  background(0);

  println(p.size());

  for (int i = 0; i < p.size(); i++)
  {
    for (int j = 0; j < p.size(); j++)
    {
      if (i == j)
      {
        continue;
      }

      if (dist(p.get(i).pos.x, p.get(i).pos.y, p.get(j).pos.x, p.get(j).pos.y) < (p.get(i).size + p.get(j).size)/2)
      {
        p.get(i).dir.x = (p.get(i).dir.x * (p.get(i).size - p.get(j).size) + (2 * p.get(j).size * p.get(j).dir.x)) / (p.get(i).size + p.get(j).size);
        p.get(i).dir.y = (p.get(i).dir.y * (p.get(i).size - p.get(j).size) + (2 * p.get(j).size * p.get(j).dir.y)) / (p.get(i).size + p.get(j).size);
        p.get(j).dir.x = (p.get(j).dir.x * (p.get(j).size - p.get(i).size) + (2 * p.get(i).size * p.get(i).dir.x)) / (p.get(i).size + p.get(j).size);
        p.get(j).dir.y = (p.get(j).dir.y * (p.get(j).size - p.get(i).size) + (2 * p.get(i).size * p.get(i).dir.y)) / (p.get(i).size + p.get(j).size);

        p.get(i).dir = new PVector(p.get(i).dir.x, p.get(i).dir.y);

        p.get(j).dir = new PVector(p.get(j).dir.x, p.get(j).dir.y);
      }
    }

    p.get(i).update();
  }
}

void mousePressed()
{
  PVector start = new PVector(mouseX, mouseY);
  PVector target = new PVector(random(width), random(height));
  
  p.add(new Particle(start, target, 20, 10));
}