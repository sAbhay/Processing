import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int flength = 20;
int fib[] = new int[flength];
String seq;

void setup() {
  minim = new Minim(this);
  music = minim.getLineOut();
  
  fib[0] = fib[1] = 1;
  
  for (int i = 2; i < flength; i++) {
    fibonacci(i);
  }
  //println(fib);
}

void draw() {

  if (playing) {
    GenerateMusic(60, arrToSeq(fib));
    playing = false;
  }
}

void generateMusic() {
  music.setTempo(60);
  music.pauseNotes();
  music.playNote(duration*10, duration, "C3");
  music.resumeNotes();
}

void fibonacci(int i) {
  fib[i] = fib[i-1] + fib[i-2];
}

String arrToSeq(int[] arr) {
  String s = "";
  for (int i = 0; i < fib.length; i++) {
    s += str(arr[i]);
  }
  return s;
}