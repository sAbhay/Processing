ArrayList<particle> p = new ArrayList<particle>();

float colourScheme = random(6);

void setup()
{
  fullScreen(P2D);
}

void draw()
{
  fill(0, 50);
  rect(0, 0, width, height);

  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());

  for (int j = 0; j < p.size() - 1; j++)
  {
    p.get(j).update();

    if (p.get(j).kill)
    {
      p.remove(j);
    }
  }

  println(colourScheme);
}

void keyPressed()
{
  if (key == '1')
  {
    colourScheme = random(0.999);
  }

  if (key == '2')
  {
    colourScheme = random(1, 1.999);
  }

  if (key == '3')
  {
    colourScheme = random(2, 2.999);
  }

  if (key == '4')
  {
    colourScheme = random(3, 3.999);
  }

  if (key == '5')
  {
    colourScheme = random(4, 4.999);
  }

  if (key == '6')
  {
    colourScheme = random(5, 5.999);
  }
}

void mousePressed()
{
  colourScheme = random(6);
}