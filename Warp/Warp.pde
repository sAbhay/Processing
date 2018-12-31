import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

ArrayList<Line> l = new ArrayList<Line>();

float colourScheme = random(7);

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
    l.add(new Line());
  }

  for (int j = 0; j < l.size() - 1; j++)
  {
    if (colourScheme >= 0 && colourScheme < 1)
    {
      l.get(j).r = 0;
      l.get(j).g = random(0, 150);
      l.get(j).b = random(100, 200);
    }

    if (colourScheme >= 1 && colourScheme < 2)
    {
      l.get(j).r = 0;
      l.get(j).b = random(0, 150);
      l.get(j).g = random(100, 200);
    }

    if (colourScheme >= 2 && colourScheme < 3)
    {
      l.get(j).b = 0;
      l.get(j).r = random(0, 150);
      l.get(j).g = random(100, 200);
    }

    if (colourScheme >= 3 && colourScheme < 4)
    {
      l.get(j).b = 0;
      l.get(j).g = random(0, 150);
      l.get(j).r = random(100, 200);;
    }

    if (colourScheme >= 4 && colourScheme < 5)
    {
      l.get(j).g = 0;
      l.get(j).b = random(0, 150);
      l.get(j).r = random(100, 200);
    }

    if (colourScheme >= 5 && colourScheme < 6)
    {
      l.get(j).g = 0;
      l.get(j).r = random(0, 150);
      l.get(j).b = random(100, 200);
    }
    
    if (colourScheme >= 6 && colourScheme < 7)
    {
      l.get(j).g = random(255);
      l.get(j).r = random(255);
      l.get(j).b = random(255);
    }

    l.get(j).update();

    if (j > 7500)
    {

      l.get(j).kill = true;
    }

    if (l.get(j).kill)
    {
      l.remove(j);
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
  
  if (key == '7')
  {
    colourScheme = random(6, 6.999);
  }
}