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

public class Creeper extends PApplet {

ArrayList<particle> p = new ArrayList<particle>();

float colourScheme = random(6);

public void setup()
{
  
}

public void draw()
{
  fill(0, 50);
  rect(0, 0, width, height);

  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());
  p.add(new particle());

  for (int j = 0; j < p.size() - 1; j++)
  {
    p.get(j).update();

    if (p.get(j).kill)
    {
      p.remove(j);
    }
  }

  println(colourScheme);
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

public void mousePressed()
{
  colourScheme = random(6);
}
class particle
{
  float x;
  float y;
  float size = 3;

  float velX = random(-9, 9);
  float velY = random(-9, 9);

  float r;
  float g;
  float b;

  boolean kill = false;

  particle()
  {
    x = random(0, width);
    y = height;
    
    if (colourScheme >= 0 && colourScheme < 1)
    {
      r = 0;
      g = random(0, 150);
      b = random(100, 200);
    }
    
    if (colourScheme >= 1 && colourScheme < 2)
    {
      r = 0;
      b = random(0, 150);
      g = random(100, 200);
    }

    if (colourScheme >= 2 && colourScheme < 3)
    {
      b = 0;
      r = random(0, 150);
      g = random(100, 200);
    }

    if (colourScheme >= 3 && colourScheme < 4)
    {
      b = 0;
      g = random(0, 150);
      r = random(100, 200);
    }
    
    if (colourScheme >= 4 && colourScheme < 5)
    {
      g = 0;
      b = random(0, 150);
      r = random(100, 200);
    }
    
    if (colourScheme >= 5 && colourScheme < 6)
    {
      g = 0;
      r = random(0, 150);
      b = random(100, 200);
    }
  }

  public void display()
  {
    fill(r, g, b);
    noStroke();
    ellipse(x, y, size, size);
  }

  public void checkBoundaries()
  { 
    /*if (x < 0)
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
     }*/

    if (x < -20| x > width + 20||y < 0||y > height + 10)
    {
      kill = true;
    }
  }

  public void move()
  {
    velX = random(-5, 5);
    velY = random(-10, -1);

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
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "Creeper" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
