import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*;

Minim minim;
AudioPlayer song;

boolean hit = false;

void setup()
{
  fullScreen();
  textAlign(CENTER);

  minim = new Minim(this);
  song = minim.loadFile("Megalovania.mp3", width);
}

void draw()
{ 
  background(0);

  textSize(50);
  text("Megalovania", width/2, height/2 - 20);

  textSize(30);
  text("by Toby Fox", width/2, height/2 + 40);

  if (keyPressed)
  {
    hit = true;
  }

  if (hit == true)
  {
    song.play();

    for (int i = 0; i < song.bufferSize() - 1; i++)
    {
      strokeWeight(5);
      stroke(255);
      line(i, 250 + song.right.get(i)*150, i+1, 250 + song.right.get(i+1)*150);
      line(i, 650 + song.left.get(i)*150, i+1, 650 + song.left.get(i+1)*150);
    }
  }
}