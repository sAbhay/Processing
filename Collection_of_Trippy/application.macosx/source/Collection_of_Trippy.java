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

public class Collection_of_Trippy extends PApplet {

int screenState = 0;
int selectedItem = 0;

boolean mouseIsPressed;
boolean mouseReleased;

public void setup()
{
  

  textAlign(CENTER);
  rectMode(CENTER);

  //noCursor();
}

public void draw()
{
  background(0);

  if (screenState == 0)
  {
    textSize(96);
    text("The Collection of Trippy", width/2, 175);

    textSize(20);
    text("NOTE: If the drawing appears to be frozen, it is working but is probably lagging.", 500, 850);

    for (int a = 100; a > 0; a-=5)
    {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
      strokeWeight(30);

      line(100, 700, 325, 700);
      line(100, 500, 325, 500);
      line(100, 700, 100, 500);
      line(325, 700, 325, 500);

      line(500, 700, 725, 700);
      line(500, 500, 725, 500);
      line(500, 700, 500, 500);
      line(725, 700, 725, 500);

      line(325, 575, 500, 575);

      line(100, 575, 300, 257.5f);
      line(725, 575, 875, 287.5f);

      line(300, 257.5f, 357.5f, 290); 
      line(875, 287.5f, 925, 315);

      ellipse(212.5f, 600, a, a);
      ellipse(612.5f, 600, a, a);
    }

    fill(255);
    strokeWeight(1);
    textSize(32);

    button(1080, 300, 60, 1, "Trippy");
    button(1080, 375, 60, 2, "Trippier");
    button(1080, 450, 60, 3, "Trippy Scales");
    button(1080, 525, 60, 4, "Static");
    button(1080, 600, 60, 5, "Weird Trippy - Colour");
    button(1080, 675, 60, 6, "Weird Trippy - Plain");
    button(1080, 750, 60, 7, "Wormhole");
    button(1080, 825, 60, 8, "More");

    if (mousePressed)
    {
      if (mouseX < 100&&mouseY<100)
      {
        screenState = 8;
      }
    }
  }

  if (screenState == 1)
  { 
    for (int x = 0; x < width/10; x++)
    {
      for (int y = 0; y < height/10; y++)
      {
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
        rect(x*10, y*10, 10, 10);
        ellipse(x*10, y*10, 5, 5);
      }
    }
  }

  if (screenState == 2)
  {
    for (int x = 0; x < width/10; x++)
    {
      for (int y = 0; y < height/10; y++)
      {
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
        rect(x*10, y*10, 10, 10);
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
        ellipse(x*10, y*10, 5, 5);
      }
    }
  }

  if (screenState == 3)
  {
    for (int a = 0; a < 216; a++)
    {
      for (int b = 0; b < 91; b++)
      {
        stroke(random(255), random(255), random(255));
        fill(random(255), random(255), random(255));
        ellipse(a*10, b*10, 20, 20);
      }
    }
  }

  if (screenState == 4)
  {
    for (int x = 0; x < width/2; x++)
    {
      for (int y = 0; y < height/2; y++)
      {
        fill(random(255), random(255), random(255));
        stroke(random(255), random(255), random(255));
        rect(x*2, y*2, 2, 2);
      }
    }
  }

  if (screenState == 5)
  {
    for (int x = 0; x < width/10; x++)
    {
      for (int y = 0; y < height/10; y++)
      {
        for (int z = 0; z < 10; z++)
        {
          stroke(random(255), random(255), random(255));
          fill(random(255), random(255), random(255));
          ellipse(x*z*10, y*z*10, z*2, z*2);
        }
      }
    }
  }

  if (screenState == 6)
  {
    for (int x = 0; x < width/10; x++)
    {
      for (int y = 0; y < height/10; y++)
      {
        for (int z = 0; z < 10; z++)
        {
          stroke(0);
          fill(255);
          ellipse(x*z*10, y*z*10, z*2, z*2);
        }
      }
    }
  }

  if (screenState == 7)
  {
    for (int z = height; z > 0; z-=5)
    {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
      ellipse(width/2, height/2, z, z);
    }
  }

  if (screenState == 8)
  {
    textSize(80);
    text("More From the Collection of Trippy", width/2, 175);

    textSize(20);
    text("NOTE: If the drawing appears to be frozen, it is working but is probably lagging.", 500, 850);

    for (int a = 100; a > 0; a-=5)
    {
      fill(random(255), random(255), random(255));
      stroke(random(255), random(255), random(255));
      strokeWeight(30);

      line(100, 700, 325, 700);
      line(100, 500, 325, 500);
      line(100, 700, 100, 500);
      line(325, 700, 325, 500);

      line(500, 700, 725, 700);
      line(500, 500, 725, 500);
      line(500, 700, 500, 500);
      line(725, 700, 725, 500);

      line(325, 575, 500, 575);

      line(100, 575, 300, 257.5f);
      line(725, 575, 875, 287.5f);

      line(300, 257.5f, 357.5f, 290); 
      line(875, 287.5f, 925, 315);

      ellipse(212.5f, 600, a, a);
      ellipse(612.5f, 600, a, a);
    }

    fill(255);
    strokeWeight(1);
    textSize(32);

    button(1080, 300, 60, 9, "Rings?");
    button(1080, 375, 60, 10, "Maw of the Void");
    button(1080, 450, 60, 11, "Trippy Squared");
    button(1080, 525, 60, 8, "---");
    button(1080, 600, 60, 8, "---");
    button(1080, 675, 60, 8, "---");
    button(1080, 750, 60, 8, "---");
    button(1080, 825, 60, 8, "---");
  }

  if (screenState == 9)
  {
    for (int x = 0; x < width/10; x++)
    {
      for (int y = 0; y < height/10; y++)
      {
        for (int z = 0; z < 10; z++)
        {
          strokeWeight(30);
          stroke(random(255), random(255), random(255));
          fill(random(255), random(255), random(255));
          ellipse(x*z*10, y*z*10, z*2, z*2);
        }
      }
    }
    strokeWeight(1);
  }

  if (screenState == 10)
  {
    for (int x = 0; x < 150; x++)
    {
      for (int y = 0; y < 150; y++)
      {
        for (int z = 0; z < 10; z++)
        {
          stroke(random(255), random(255), random(255));
          fill(random(255), random(255), random(255));
          ellipse(x*z*10, y*z*10, z*x*y/10, z*y*x/10);
        }
      }
    }
  }

  if (screenState == 11)
  {
    for (int x = 0; x < 37; x++)
    {
      for (int y = 0; y < 23; y++)
      {
        for (int z = 30; z > 0; z--)
        {
          fill(random(255), random(255), random(255));
          stroke(random(255), random(255), random(255));
          rect(x*40, y*40, z, z);
        }
      }
    }
  }
}

public void button(int x1, int y1, int buttonHeight, int number, String buttonText)
{
  float buttonWidth = buttonText.length() * 13 * 1.5384615385f;
  fill(255, 0);
  stroke(255, 0);
  rect(x1, y1, buttonWidth, buttonHeight);
  fill(255);
  textSize(30);
  text(buttonText, x1, y1 + buttonHeight/6.5f);
  if (mouseX>=(x1-(buttonWidth/2))&&mouseY>=(y1-(buttonHeight/2))&&mouseX<=(x1+(buttonWidth/2))&&mouseY<=(y1+(buttonHeight/2)))
  {
    if (mousePressed)
    {
      screenState = number;
    }
  }
}

public void keyPressed()
{
  if (key == ESC)
  {
    if (screenState != 0)
    {
      key = 0;
      screenState = 0;
    }
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "Collection_of_Trippy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
