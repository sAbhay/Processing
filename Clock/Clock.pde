import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage backdrop;
PImage black;
PImage newYork1;
PImage newYork2;
PImage turtle;
PImage sunset1;
PImage sunset2;
PImage snow;
PImage forest1;
PImage forest2;

int imageNumber = 0;

boolean lowerMenu;

Minim alarm;
AudioPlayer defaultAlarm;

void setup()
{
  fullScreen(); 

  textAlign(RIGHT);

  imageMode(CENTER);
  rectMode(CENTER);

  black = loadImage("black.jpg");
  newYork1 = loadImage("newYork1.jpg");
  newYork2 = loadImage("newYork2.jpg");
  turtle = loadImage("turtle.jpg");
  sunset1 = loadImage("sunset1.jpg");
  sunset2 = loadImage("sunset2.jpg");
  snow = loadImage("snow.jpg");
  forest1 = loadImage("forest1.jpg");
  forest2 = loadImage("forest2.jpg");
  
  alarm = new Minim(this);
  defaultAlarm = alarm.loadFile("holy crap.mp3");
}

void draw()
{ 
  if (imageNumber == 0)
  {
    backdrop = loadImage("black.jpg");
  } else if (imageNumber == 1)
  {
    backdrop = loadImage("newYork1.jpg");
  } else if (imageNumber == 2)
  {
    backdrop = loadImage("newYork2.jpg");
  } else if (imageNumber == 3)
  {
    backdrop = loadImage("turtle.jpg");
  } else if (imageNumber == 4)
  {
    backdrop = loadImage("sunset1.jpg");
  } else if (imageNumber == 5)
  {
    backdrop = loadImage("sunset2.jpg");
  } else if (imageNumber == 6)
  {
    backdrop = loadImage("snow.jpg");
  } else if (imageNumber == 7)
  {
    backdrop = loadImage("forest1.jpg");
  } else if (imageNumber == 8)
  {
    backdrop = loadImage("forest2.jpg");
  }

  backdrop.resize(width, height);
  image(backdrop, width/2, height/2);

  imgButton(100, 100, 150, 150, black, 0);
  imgButton(300, 100, 150, 150, newYork1, 1);
  imgButton(500, 100, 150, 150, newYork2, 2);
  
  digitalClock(width/2 + 50, height/2 + 50);
  
  date(width/2, height/2 + 300);

  lowerMenu(width/2, width, 400);
}

void imgButton(int x1, int y1, int buttonWidth, int buttonHeight, PImage imgName, int imgNo)
{
  imgName.resize(buttonWidth, buttonHeight);
  image(imgName, x1, y1); 

  if (mouseX>=(x1-(buttonWidth/2))&&mouseY>=(y1-(buttonHeight/2))&&mouseX<=(x1+(buttonWidth/2))&&mouseY<=(y1+(buttonHeight/2)))
  {
    buttonWidth += 100;
    buttonHeight += 100;

    if (mousePressed)
    {
      imageNumber = imgNo;
    }
  }
}

void lowerMenu(float x1, float Width, float Height)
{
  float y1 = height + Height/2 - 10;
  float buttonWidth = 50; 
  float buttonHeight = 25;
  float buttonX = x1;
  float buttonY = y1 - (Height/2 + buttonHeight/2);

  fill(255);
  stroke(255);
  rect(x1, y1, Width, Height);
  rect(buttonX, buttonY, buttonWidth, buttonHeight);

  if (lowerMenu == false)
  {
    y1 = height + Height/2 - 10;
    
    if (mouseX>=(buttonX-(buttonWidth/2))&&mouseY>=(buttonY-(buttonHeight/2))&&mouseX<=(buttonX+(buttonWidth/2))&&mouseY<=(buttonY+(buttonHeight/2)))
    {
      if (mousePressed)
      {
        lowerMenu = true;
      }
    }
  }

  if (lowerMenu)
  {
    y1 = height - Height + 10;
    
    if (mouseX>=(buttonX-(buttonWidth/2))&&mouseY>=(buttonY-(buttonHeight/2))&&mouseX<=(buttonX+(buttonWidth/2))&&mouseY<=(buttonY+(buttonHeight/2)))
    {
      if (mousePressed)
      {
        lowerMenu = false;
      }
    }
  }
}

void digitalClock(float x1, float y1)
{
 int s = second();
  int m = minute();
  int h = hour();

  fill(255);
  textSize(180);

  if (s < 10)
  {
    text('0', x1 + 187.5, y1);
  }

  if (m < 10)
  {
    text('0', x1 - 112.5, y1);
  }

  if (h > 12)
  {
    h -= 12;

    textSize(72);
    text("PM", x1 + 440, y1);
  } else {
    textSize(72);
    text("AM",x1 + 440, y1);
  }

  textSize(180);

  text(s, x1 + 300, y1);

  text(m, x1, y1);

  text(h, x1 - 300, y1);
  
  text(":", x1 - 236.25, y1 - 10);
  text(":", x1 + 63.75, y1 - 10);
}

void date(float x1, float y1)
{
  int d = day();
  int m = month();
  int y = year(); 
  
  fill(255);
  textSize(90);

  if (d < 10)
  {
    text('0', x1 + 93.75, y1);
  }

  if (m < 10)
  {
    text('0', x1 - 56.25, y1);
  }

  text(y, x1 + 150, y1);

  text(m, x1, y1);

  text(d, x1 - 150, y1);
  
  text("/", x1 - 236.25, y1 - 10);
  text("/", x1 + 63.75, y1 - 10);
}