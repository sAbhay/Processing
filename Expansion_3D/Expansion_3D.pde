import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

ArrayList<particle> p = new ArrayList<particle>();

float colourScheme = random(6);

PeasyCam cam;


void setup()
{
  fullScreen(P3D);

  cam = new PeasyCam(this, 0, 0, 0, 10);
  cam.setMaximumDistance(800);
  cam.setMinimumDistance(10);

  sphereDetail(10);
}

void draw()
{
  background(0, 50);

  for (int i = 0; i < 25; i++)
  {
    p.add(new particle());
  }

  for (int j = 0; j < p.size() - 1; j++)
  {
    if (colourScheme >= 0 && colourScheme < 1)
    {
      p.get(j).r = 0;
      p.get(j).g = random(0, 150);
      p.get(j).b = random(100, 200);

      p.get(j).sr = 0;
      p.get(j).sg = random(0, 150);
      p.get(j).sb = random(100, 200);
    }

    if (colourScheme >= 1 && colourScheme < 2)
    {
      p.get(j).r = 0;
      p.get(j).b = random(0, 150);
      p.get(j).g = random(100, 200);

      p.get(j).sr = 0;
      p.get(j).sb = random(0, 150);
      p.get(j).sg = random(100, 200);
    }

    if (colourScheme >= 2 && colourScheme < 3)
    {
      p.get(j).b = 0;
      p.get(j).r = random(0, 150);
      p.get(j).g = random(100, 200);

      p.get(j).sb = 0;
      p.get(j).sr = random(0, 150);
      p.get(j).sg = random(100, 200);
    }

    if (colourScheme >= 3 && colourScheme < 4)
    {
      p.get(j).b = 0;
      p.get(j).g = random(0, 150);
      p.get(j).r = random(100, 200);

      p.get(j).sb = 0;
      p.get(j).sr = random(0, 150);
      p.get(j).sg = random(100, 200);
    }

    if (colourScheme >= 4 && colourScheme < 5)
    {
      p.get(j).g = 0;
      p.get(j).b = random(0, 150);
      p.get(j).r = random(100, 200);

      p.get(j).sg = 0;
      p.get(j).sb = random(0, 150);
      p.get(j).sr = random(100, 200);
    }

    if (colourScheme >= 5 && colourScheme < 6)
    {
      p.get(j).g = 0;
      p.get(j).r = random(0, 150);
      p.get(j).b = random(100, 200);

      p.get(j).sg = 0;
      p.get(j).sr = random(0, 150);
      p.get(j).b = random(100, 200);
    }

    p.get(j).update();

    if (j > 7500)
    {

      p.get(j).kill = true;
    }

    if (p.get(j).kill)
    {
      p.remove(j);
    }
  }
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