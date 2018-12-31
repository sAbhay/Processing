import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

void setup()
{
  cam = new PeasyCam(this, 450, 450, 450, 450);
  cam.setMaximumDistance(500);
  cam.setMinimumDistance(0);

  fullScreen(P3D);
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
        
        translate(x*30, y*30, z*30);
        fill(random(255), random(255), random(255), random(10, 30));
        stroke(random(255), random(255), random(255));
        box(30, 30, 30);
        
        popMatrix();
      }
    }
  }
}