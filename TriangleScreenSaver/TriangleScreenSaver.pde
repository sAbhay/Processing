PVector[] pos = new PVector[25];
PVector[] vel = new PVector[pos.length];

void setup()
{
  fullScreen(P3D);

  for (int i = 0; i < pos.length; i++)
  {
    pos[i] = new PVector(random(width), random(height));
    vel[i] = new PVector();

    if ((int) random(2) == 0)
    {
      vel[i].x = random(2, 5);
    } else
    {
      vel[i].x = random(-5, -2);
    }

    if ((int) random(2) == 0)
    {
      vel[i].y = random(2, 5);
    } else
    {
      vel[i].y = random(-5, -2);
    }
  }

  noStroke();
  noCursor();
  colorMode(HSB);
}

void draw()
{
  background(0);

  for (int i = 0; i < pos.length; i++)
  {
    pos[i].add(vel[i]);

    PVector p1 = new PVector(pos[i].x, pos[i].y);
    PVector p2 = p1;
    PVector p3 = p2;

    for (int j = 0; j < pos.length; j++)
    {
      if (i != j)
      { 
        if (dist(pos[i].x, pos[i].y, pos[j].x, pos[j].y) < 300)
        {
          if (p2 != p1)
          {
            p3 = new PVector(pos[j].x, pos[j].y);
          } else
          {
            p2 = new PVector(pos[j].x, pos[j].y);
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

  checkBoundaries();
}

void checkBoundaries()
{
  for (int i = 0; i < pos.length; i++)
  {
    if (pos[i].x <= 0 || pos[i].x >= width) vel[i].x *= -1;
    if (pos[i].y <= 0 || pos[i].y >= height) vel[i].y *= -1;
  }
}

void mousePressed()
{
  exit();
}