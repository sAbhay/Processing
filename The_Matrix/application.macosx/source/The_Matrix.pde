import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

void setup()
{
  cam = new PeasyCam(this, 150, 150, 150, 500);
  cam.setMaximumDistance(500);
  cam.setMinimumDistance(0);

  fullScreen(P3D);
  
  sphereDetail(15);
}

void draw()
{
  background(0);
  
  for (int x = 0; x < 10; x++)
  {
    for (int y = 0; y < 10; y++)
    {
      for (int z = 0; z < 10; z++)
      { 
        pushMatrix();
        
        translate(x*30, y*30, z*30);
        fill(random(100));
        stroke(255, 0, 0, 75);
        sphere(3);
        
        popMatrix();
      }
    }
  }
}