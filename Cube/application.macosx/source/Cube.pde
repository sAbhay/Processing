import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

void setup()
{
  fullScreen(P3D);
  rectMode(CENTER);

  cam = new PeasyCam(this, 15, 15, 0, 100);
  cam.setMinimumDistance(130);
  cam.setMaximumDistance(130);
}

void draw()
{ 
  background(0);

  for (int x = 0; x < 30; x++)
  {
    for (int y = 0; y < 30; y++)
    {
      for (int z = 0; z < 30; z++)
      {
        pushMatrix();
        translate(x, y, z);
        fill(random(255), random(255), random(255), 75);
        stroke(random(255), random(255), random(255));
        box(20, 20, 20);
        /*noStroke();
         lights();
         sphere(5);*/
        popMatrix();
      }
    }
  }
}