import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer snare;
AudioPlayer bass;
AudioPlayer highHat;
AudioPlayer tom1;
AudioPlayer tom2;
AudioPlayer cymbal1;
AudioPlayer cymbal2;

boolean highHatPedal = false;

char w;
char d;
char a;

void setup()
{
  fullScreen();

  minim = new Minim (this);

  //snare = minim.loadFile();
  //bass = minim.loadFile();
  
  if(highHatPedal)
  {
   //highHat = minim.loadFile(); 
  } else {
   //highHat = minim.loadFile(); 
  }
}

void draw()
{
  background(0);

  drum(width/2, height/1.384, height/2.25, height/2.25, bass);
  drum(width/2, height/2, 300, 300, snare);
  //drum(width/2, height/2, 300, 300, highHat);
  //drum(width/2, height/2, 300, 300, tom1);
  //drum(width/2, height/2, 300, 300, tom2);
  //drum(width/2, height/2, 300, 300, cymbal1);
  //drum(width/2, height/2, 300, 300, cymbal2);
}

void drum(float x, float y, float w, float h, AudioPlayer sound)
{
  ellipse(x, y, w, h);

  if (mousePressed)
  {
    if (mouseX < x + w/2 && mouseX > x - x/2 && mouseY > y - h/2 && mouseY < y + h/2)
    {
      sound.play();
    }
  }
} 

void keyPressed()
{
  if(key == 'w'||key == 'k')
  {
   highHat.play(); 
  }
  
  if(key == 'a'||key == 'l')
  {
   snare.play(); 
  }
  
  if(key == ' '||key == 'j')
 {
  bass.play(); 
 }
}