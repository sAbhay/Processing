import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

ArrayList<star> s = new ArrayList<star>();

void setup()
{
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMaximumDistance(3000);
  cam.setMinimumDistance(0);

  fullScreen(P3D);

  sphereDetail(8);
}

void draw()
{
  background(0);

  for (int i = 0; i < 5; i++)
  { 
    s.add(new star());
  }

  for (int i = 0; i < s.size() - 1; i++)
  {
    s.get(i).display();
  }
}