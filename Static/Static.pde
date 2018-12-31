import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer beep;

int size = 2;

void setup()
{
  fullScreen(P3D);
  rectMode(CENTER);
  noCursor();
  noStroke();

  minim = new Minim(this);
  beep = minim.loadFile("beep.mp3");
}

void draw()
{ 
  beep.play();

  for (int x = 0; x < width/size; x++)
  {
    for (int y = 0; y < height/size; y++)
    {
      fill(random(255));
      rect(x*size, y*size, size, size);
    }
  }
}

void keyPressed()
{
  if (key==ESC)
  {
    key=0;
  }
}