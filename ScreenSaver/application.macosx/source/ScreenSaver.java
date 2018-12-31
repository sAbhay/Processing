import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ScreenSaver extends PApplet {

ArrayList<particle> p = new ArrayList<particle>();

public void setup()
{
  
}

public void draw()
{
  fill(0, 50);
  rect(0, 0, width, height);

  p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5))); 

  for (int j = 0; j < p.size() - 1; j++)
  {
    p.get(j).update();

    if (j > 1000)
    {
      p.get(j-1000).kill = true;

      if (p.get(j-1000).kill)
      {
        p.remove(j-1000);
      }
    }
  }
}

public void mousePressed()
{
 exit(); 
}
class particle
{
  float x;
  float y;
  float size = random(1, 10);

  float velX = random(-9, 9);
  float velY = random(-9, 9);
  
  float r = random(255);
  float g = random(255);
  float b = random(255);

  boolean kill = false;

  particle()
  {
    x = random(0, width);;
    y = random(0, height);;
  }

  particle(float _size, float _velX, float _velY)
  {
    _size = size;
    _velX = velX;
    _velY = velY;

    x = random(0, width);
    y = random(0, height);
  }
  
  public void display()
  {
   fill(r, g, b);
   noStroke();
   ellipse(x, y, size, size); 
  }
  
  public void checkBoundaries()
  { 
    if (x < 0)
    {
      x = 0;
      velX *= -1;
    }

    if (x > width)
    {
      x = width;
      velX *= -1;
    }

    if (y < 0)
    {
      y = 0;
      velY *= -1;
    }

    if (y > height)
    {
      y = height;
      velY *= -1;
    }
  }
  
  public void move()
  {
    x += velX;
    y += velY;
  }
  
  public void update()
  {
   display();
   checkBoundaries();
   move();
  }
}
  public void settings() {  fullScreen(P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#000000", "--hide-stop", "ScreenSaver" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
