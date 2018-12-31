import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 
import peasy.org.apache.commons.math.*; 
import peasy.org.apache.commons.math.geometry.*; 
import peasy.test.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class The_Matrix extends PApplet {






PeasyCam cam;

public void setup()
{
  cam = new PeasyCam(this, 150, 150, 150, 500);
  cam.setMaximumDistance(500);
  cam.setMinimumDistance(0);

  
  
  sphereDetail(15);
}

public void draw()
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
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "The_Matrix" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
