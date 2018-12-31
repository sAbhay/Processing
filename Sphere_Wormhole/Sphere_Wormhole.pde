import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

float x = 0;
float y = 0;
float z = 0;

void setup()
{
  fullScreen(P3D);
  
  cam = new PeasyCam(this, 250);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);
}

void draw()
{
  for(int i = 500; i > 0; i--)
  {
  pushMatrix();
  stroke(random(255), random(255), random(255));
  fill(random(255), random(255), random(255));
  translate(x, y, z);
  sphere(i);
  popMatrix();
  }
}