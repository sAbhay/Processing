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

public class Karan_on_LSD extends PApplet {






PeasyCam cam;

public void setup()
{
  cam = new PeasyCam(this, 450, 450, 450, 450);
  cam.setMaximumDistance(500);
  cam.setMinimumDistance(0);

  
}

public void draw()
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
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "Karan_on_LSD" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
