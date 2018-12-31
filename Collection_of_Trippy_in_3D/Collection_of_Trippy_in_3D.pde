import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

int screenState = 0;
int selectedItem = 0;

void setup()
{
  fullScreen();

  textAlign(CENTER);
  rectMode(CENTER);

  noCursor();
}

void draw()
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

      line(100, 575, 300, 257.5);
      line(725, 575, 875, 287.5);

      line(300, 257.5, 357.5, 290); 
      line(875, 287.5, 925, 315);

      ellipse(212.5, 600, a, a);
      ellipse(612.5, 600, a, a);
    }

    fill(255);
    strokeWeight(1);
    textSize(32);

    if (selectedItem == 0)
    { 
      fill(0, 255, 0);
    }

    text("Trippy", 1080, 300);
    fill(255);

    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }

    text("Trippier", 1080, 375);
    fill(255);

    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }

    text("Trippy Scales", 1080, 450);
    fill(255);

    if (selectedItem == 3)
    {
      fill(0, 255, 0);
    }

    text("Static", 1080, 525);
    fill(255);

    if (selectedItem == 4)
    {
      fill(0, 255, 0);
    }

    text("Weird Trippy - Colour", 1080, 600);
    fill(255);

    if (selectedItem == 5)
    {
      fill(0, 255, 0);
    }

    text("Weird Trippy - Plain", 1080, 675);
    fill(255);

    if (selectedItem == 6)
    {
      fill(0, 255, 0);
    }

    text("Wormhole", 1080, 750);
    fill(255);

    if (selectedItem == 7)
    {
      fill(0, 255, 0);
    }

    text("More", 1080, 825);
    fill(255);

    if (selectedItem<0)
    {
      selectedItem = 7;
    }

    if (selectedItem>7)
    {
      selectedItem = 0;
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

      line(100, 575, 300, 257.5);
      line(725, 575, 875, 287.5);

      line(300, 257.5, 357.5, 290); 
      line(875, 287.5, 925, 315);

      ellipse(212.5, 600, a, a);
      ellipse(612.5, 600, a, a);
    }

    fill(255);
    strokeWeight(1);
    textSize(32);

    if (selectedItem == 0)
    { 
      fill(0, 255, 0);
    }

    text("Rings?", 1080, 300);
    fill(255);

    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }

    text("Maw of the Void", 1080, 375);
    fill(255);

    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }

    text("Trippy Squared", 1080, 450);
    fill(255);

    if (selectedItem == 3)
    {
      fill(0, 255, 0);
    }

    text("---", 1080, 525);
    fill(255);

    if (selectedItem == 4)
    {
      fill(0, 255, 0);
    }

    text("---", 1080, 600);
    fill(255);

    if (selectedItem == 5)
    {
      fill(0, 255, 0);
    }

    text("---", 1080, 675);
    fill(255);

    if (selectedItem == 6)
    {
      fill(0, 255, 0);
    }

    text("---", 1080, 750);
    fill(255);

    if (selectedItem == 7)
    {
      fill(0, 255, 0);
    }

    text("---", 1080, 825);
    fill(255);

    if (selectedItem<0)
    {
      selectedItem = 7;
    }

    if (selectedItem>7)
    {
      selectedItem = 0;
    }
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

void keyPressed()
{
  if (screenState == 0)
  {
    if (key=='w')
    {
      selectedItem--;
    }

    if (key=='s')
    {
      selectedItem++;
    }

    if (key==' ')
    {
      if (selectedItem == 0)
      {
        screenState = 1;
      }

      if (selectedItem == 1)
      {
        screenState = 2;
      }

      if (selectedItem == 2)
      {
        screenState = 3;
      }

      if (selectedItem == 3)
      {
        screenState = 4;
      }

      if (selectedItem == 4)
      {
        screenState = 5;
      }

      if (selectedItem == 5)
      {
        screenState = 6;
      }

      if (selectedItem == 6)
      {
        screenState = 7;
      }

      if (selectedItem == 7)
      {
        screenState = 8;
      }
    }
  }

  if (screenState != 0)
  {
    if (key==ESC)
    {
      key = 0;
      screenState = 0;
    }
  }

  if (screenState == 8)
  {
    if (key=='w')
    {
      selectedItem--;
    }

    if (key=='s')
    {
      selectedItem++;
    }

    if (key==' ')
    {
      if (selectedItem == 0)
      {
        screenState = 9;
      }

      if (selectedItem == 1)
      {
        screenState = 10;
      }

      if (selectedItem == 2)
      {
        screenState = 11;
      }
    }
  }
}