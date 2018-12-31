import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect kinect;
KinectTracker tracker;

void setup()
{
  fullScreen(P3D);
  
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw()
{
  background(0);
  
  tracker.track();
  
  tracker.display();
  
  PVector v1 = tracker.getPos();
  
  fill(0, 128, 255);
  ellipse(v1.x, v1.y, 20, 20);
  
  PVector v2 = tracker.getLerpedPos();
  
  fill(128, 255, 0);
  ellipse(v2.x, v2.y, 20, 20);
}