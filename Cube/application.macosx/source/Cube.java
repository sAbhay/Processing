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

public class Cube extends PApplet {






PeasyCam cam;

public void setup()
{
  
  rectMode(CENTER);

  cam = new PeasyCam(this, 15, 15, 0, 100);
  cam.setMinimumDistance(130);
  cam.setMaximumDistance(130);
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
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "Cube" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
