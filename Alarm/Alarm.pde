import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer alarm;

void setup()
{
  minim = new Minim(this);
  alarm = minim.loadFile("holy crap.mp3");
}

void draw()
{
  int h = hour();
  int m = minute();
  
  if(h == 6 && m == 30)
  {
   alarm.play(); 
  }
  
  if(h == 7 && m == 0)
  {
   alarm.play(); 
  }
}