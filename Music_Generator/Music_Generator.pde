import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput output;

int octave[] = {3, 4, 5};

String notes[][] = 
  //The Following Scales are Major Scales
  {{"Not Actually a Scale"}, 
  {"C" + octave[0], "D" + octave[0], "E" + octave[0], "F" + octave[0], "G" + octave[0], "A" + octave[0], "B" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "F" + octave[1], "G" + octave[1]}, //C Major
  {"Db" + octave[0], "Eb" + octave[0], "F" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "Gb" + octave[1], "Ab" + octave[1]}, //C# or Db Major
  {"D" + octave[0], "E" + octave[0], "Gb" + octave[0], "G" + octave[0], "A" + octave[0], "B" + octave[0], "Db" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "G" + octave[1], "A" + octave[1]}, //D Major
  {"Eb" + octave[0], "F" + octave[0], "G" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "D" + octave[1], "Eb" + octave[1], "F" + octave[1], "G" + octave[1], "Ab" + octave[1], "Bb" + octave[1]}, //D# or Eb Major
  {"E" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "A" + octave[0], "B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "A" + octave[1], "B" + octave[1]},  //E Major
  {"F" + octave[0], "G" + octave[0], "A" + octave[0], "Bb" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "F" + octave[1], "G" + octave[1], "A" + octave[1], "Bb" + octave[1], "C" + octave[2]},  //F Major
  {"Gb" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "B" + octave[1], "Db" + octave[2]}, //F# or Gb Major
  {"G" + octave[0], "A" + octave[0], "B" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "G" + octave[1], "A" + octave[1], "B" + octave[1], "C" + octave[2], "D" + octave[2]}, //G Major
  {"Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "G" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "C" + octave[2], "Db" + octave[2], "Eb" + octave[2]}, //G# or Ab Major
  {"A" + octave[0], "B" + octave[0], "Db" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "A" + octave[1], "B" + octave[1], "Db" + octave[2], "D" + octave[2], "E" + octave[2]}, //A Major
  {"Bb" + octave[0], "C" + octave[1], "D" + octave[1], "Eb" + octave[1], "F" + octave[1], "G" + octave[1], "A" + octave[1], "Bb" + octave[1], "C" + octave[2], "D" + octave[2], "Eb" + octave[2], "F" + octave[2]}, //A# or Bb Major
  {"B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "E" + octave[1], "Gb" + octave[1], "Ab" + octave[1], "Bb" + octave[1], "B" + octave[1], "Db" + octave[2], "Eb" + octave[2], "E" + octave[2], "Gb" + octave[2]}, //B Major 
  //The Following Scales are Harmonic Minor Scales
  {"A" + octave[0], "B" + octave[0], "C" + octave[1], "D" + octave[1], "E" + octave[1], "F" + octave[1], "G#" + octave[1], "A" + octave[1]}, //A Harmonic Minor
  {"Bb" + octave[0], "C" + octave[1], "Db" + octave[1], "Eb" + octave[1], "F" + octave[1], "Gb" + octave[1], "A" + octave[1], "Bb" + octave[1]}, //A# or Bb Harmonic Minor
  {"B" + octave[0], "Db" + octave[1], "D" + octave[1], "E" + octave[1], "Gb" + octave[1], "G" + octave[1], "Bb" + octave[1], "B" + octave[1]}, //B Harmonic Minor
  {"C" + octave[0], "D" + octave[0], "Eb" + octave[0], "F" + octave[0], "G" + octave[0], "Ab" + octave[0], "B" + octave[0], "C" + octave[1]}, //C Harmonic Minor
  {"Db" + octave[0], "Eb" + octave[0], "E" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "A" + octave[0], "C" + octave[1], "Db" + octave[1]}, //C# or Db Harmonic Minor
  {"D" + octave[0], "E" + octave[0], "F" + octave[0], "G" + octave[0], "A" + octave[0], "Bb" + octave[0], "Db" + octave[1], "D" + octave[1]}, //D Harmonic Minor
  {"Eb" + octave[0], "F" + octave[0], "Gb" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "B" + octave[0], "D" + octave[1], "Eb" + octave[1]}, //D# or Eb Harmonic Minor
  {"E" + octave[0], "Gb" + octave[0], "G" + octave[0], "A" + octave[0], "B" + octave[0], "C" + octave[1], "Eb" + octave[1], "E" + octave[1]}, //E Harmonic Minor
  {"F" + octave[0], "G" + octave[0], "Ab" + octave[0], "Bb" + octave[0], "C" + octave[1], "Db" + octave[1], "E" + octave[1], "F" + octave[1]}, //F Harmonic Minor
  {"Gb" + octave[0], "Ab" + octave[0], "A" + octave[0], "B" + octave[0], "Db" + octave[1], "D" + octave[1], "F" + octave[1], "Gb" + octave[1]}, //F# or Gb Harmonic Minor
  {"G" + octave[0], "A" + octave[0], "Bb" + octave[0], "C" + octave[1], "D" + octave[1], "Eb" + octave[1], "Gb" + octave[1], "G" + octave[1]}, //G Harmonic Minor
  {"Ab" + octave[0], "Bb" + octave[0], "B" + octave[0], "Db" + octave[1], "Eb" + octave[1], "E" + octave[1], "G" + octave[1], "Ab" + octave[1]}}; //G# or Ab Harmonic Minor}


int numberOfNotes = 20;
int scale;
float duration;
String scaleName[] = {"None", "C Major", "Db Major", "D Major", "Eb Major", "E Major", "F Major", 
                      "Gb Major", "Ab Major", "A Major", "Bb Major", "B Major", "A Harmonic Minor",
                      "Bb Harmonic Minor", "B Harmonic Minor", "C Harmonic Minor", "Db Harmonic Minor",
                      "D Harmonic Minor", "Eb Harmonic Minor", "E Harmonic Minor", "F Harmonic Minor",
                      "Gb Harmonic Minor", "G Harmonic Minor", "Ab Harmonic Minor", "Chromatic"};

boolean playing;

int note;

int time;

void setup()
{
  fullScreen(P3D);
  
  time = millis();

  minim = new Minim(this);
  output = minim.getLineOut();
  
  textAlign(CENTER);
}

void draw()
{
  background(0);
  
  if(time < millis())
  {
    scale = (int) random(1, 23);

    generate(60, scale);
    
    time += 10000;
  }
  
    fill(255);
    textSize(24);
    text("Now Playing From: " + scaleName[scale], width/2, height/2);
}

void generate(int tempo, int scale)
{ 
  output.setTempo(tempo);
  
  output.pauseNotes();

  for (int i = 0; i < numberOfNotes; i++)
  { 
    if(i > 1 && i < numberOfNotes - 1)
    {
    note = (int) random(notes[scale].length-4);
    }
    else if(i == 1 || i == numberOfNotes - 1)
    {
     note = 0; 
    }
    
    float duration = 1.0;

    output.playNote(i*duration/2, duration, notes[scale][note]);
    
    int third = note + 2;
    int fifth = note + 4;
    
    if(note >= notes[scale].length - 2)
    {
      third = note + 2 - notes[scale].length;
    }
    
    if(note >= notes[scale].length - 4)
    {
      fifth = note + 4 - notes[scale].length;
    }
    
    output.playNote(i*duration/2, duration, notes[scale][third]);
    output.playNote(i*duration/2, duration, notes[scale][fifth]);
  }
  
  output.resumeNotes();
}