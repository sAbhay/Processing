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

public class Expansion_3D extends PApplet {






ArrayList<particle> p = new ArrayList<particle>();

float colourScheme = random(6);

PeasyCam cam;


public void setup()
{
  

  cam = new PeasyCam(this, 0, 0, 0, 10);
  cam.setMaximumDistance(800);
  cam.setMinimumDistance(10);

  sphereDetail(10);
}

public void draw()
{
  background(0, 50);

  for (int i = 0; i < 25; i++)
  {
    p.add(new particle());
  }

  for (int j = 0; j < p.size() - 1; j++)
  {
    if (colourScheme >= 0 && colourScheme < 1)
    {
      p.get(j).r = 0;
      p.get(j).g = random(0, 150);
      p.get(j).b = random(100, 200);

      p.get(j).sr = 0;
      p.get(j).sg = random(0, 150);
      p.get(j).sb = random(100, 200);
    }

    if (colourScheme >= 1 && colourScheme < 2)
    {
      p.get(j).r = 0;
      p.get(j).b = random(0, 150);
      p.get(j).g = random(100, 200);

      p.get(j).sr = 0;
      p.get(j).sb = random(0, 150);
      p.get(j).sg = random(100, 200);
    }

    if (colourScheme >= 2 && colourScheme < 3)
    {
      p.get(j).b = 0;
      p.get(j).r = random(0, 150);
      p.get(j).g = random(100, 200);

      p.get(j).sb = 0;
      p.get(j).sr = random(0, 150);
      p.get(j).sg = random(100, 200);
    }

    if (colourScheme >= 3 && colourScheme < 4)
    {
      p.get(j).b = 0;
      p.get(j).g = random(0, 150);
      p.get(j).r = random(100, 200);

      p.get(j).sb = 0;
      p.get(j).sr = random(0, 150);
      p.get(j).sg = random(100, 200);
    }

    if (colourScheme >= 4 && colourScheme < 5)
    {
      p.get(j).g = 0;
      p.get(j).b = random(0, 150);
      p.get(j).r = random(100, 200);

      p.get(j).sg = 0;
      p.get(j).sb = random(0, 150);
      p.get(j).sr = random(100, 200);
    }

    if (colourScheme >= 5 && colourScheme < 6)
    {
      p.get(j).g = 0;
      p.get(j).r = random(0, 150);
      p.get(j).b = random(100, 200);

      p.get(j).sg = 0;
      p.get(j).sr = random(0, 150);
      p.get(j).b = random(100, 200);
    }

    p.get(j).update();

    if (j > 7500)
    {

      p.get(j).kill = true;
    }

    if (p.get(j).kill)
    {
      p.remove(j);
    }
  }
}

public void keyPressed()
{
  if (key == '1')
  {
    colourScheme = random(0.999f);
  }

  if (key == '2')
  {
    colourScheme = random(1, 1.999f);
  }

  if (key == '3')
  {
    colourScheme = random(2, 2.999f);
  }

  if (key == '4')
  {
    colourScheme = random(3, 3.999f);
  }

  if (key == '5')
  {
    colourScheme = random(4, 4.999f);
  }

  if (key == '6')
  {
    colourScheme = random(5, 5.999f);
  }
}

class particle
{
  float x;
  float y;
  float z;
  float size = 3;

  float velX = random(-9, 9);
  float velY = random(-9, 9);
  float velZ = random(-9, 9);

  float r;
  float g;
  float b;
  
  float sr;
  float sg;
  float sb;

  boolean kill = false;

  particle()
  {
    x = 0;
    y = 0;
    z = 0;
  }

  public void display()
  {
    fill(r, g, b, 50);
    stroke(sr, sg, sb, 50);
    
    pushMatrix();
    
    translate(x, y, z);
    sphere(size);
    
    popMatrix();
  }

  public void checkBoundaries()
  { 
    if (x < (-width/2))
     {
     x = width/2;
     }
     
     if (x > width/2)
     {
     x = (-width/2);
     }
     
     if (y < (-height/2))
     {
     y = height/2;
     }
     
     if (y > height/2)
     {
     y = (-height/2);
     }
     
     if(z > 800)
     {
      z = -800; 
     }
     
     if(z < (-800))
     {
      z = 800; 
     }

    /*if (x < -20| x > width + 20||y < 0||y > height + 10)
    {
      kill = true;
    }*/
  }

  public void move()
  {
    velX = random(-10, 10);
    velY = random(-10, 10);
    velZ = random(-10, 10);

    x += velX;
    y += velY;
    z += velZ;
  }

  public void update()
  {
    display();
    checkBoundaries();
    move();
  }
}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#000000", "--hide-stop", "Expansion_3D" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
