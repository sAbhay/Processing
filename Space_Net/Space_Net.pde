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
  
  cam.setRollRotationMode();

  fullScreen(P3D);
  
  sphereDetail(1);
}

void draw()
{
  background(0);
  
  s.add(new star());
  s.add(new star());
  s.add(new star());
  s.add(new star());
  s.add(new star());
  
  for(int i = 0; i < s.size() - 1; i++)
  {
    s.get(i).display(s.get(i+1).lx, s.get(i+1).ly, s.get(i+1).lz);
    
    //s.add(new star(s.get(i+1).lx, s.get(i+1).ly));
  }
}