import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import queasycam.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Robot1 extends PApplet {



QueasyCam cam; 

float scale = 8;
PVector pos = new PVector(0, 0, 0);
PVector dim = new PVector(28*scale, 4*scale, 28.3f*scale);
float maxh = 72*scale;
float polePos = 0*scale;
float h = -1.5f*dim.y;
float ih = -1.5f*dim.y;
float lf = 15*scale+polePos;
float lt = 13*scale+polePos;
float clamp = 0;
float bS = 2.5f*scale; // beamSize
float w = 13*scale + 2*bS;
boolean hold = false;

public void setup() {
  
  cam = new QueasyCam(this);
}

public void draw() {  
  if (keyPressed) {
    if (key == 'r') {
      clamp -= 0.01f;
    } else if (key == 't') {
      clamp += 0.01f;
    }
    if (key == CODED) {
      if (keyCode == UP) {
        h--;
      } else if (keyCode == DOWN) {
        h++;
      }
    }
  }

  if (clamp < 0) hold = true;
  else if (clamp == 0) {
    hold = true; 
    ih = h;
  } else if (clamp > 0) hold = false;

  background(0); // chassis
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  box(dim.x, dim.y, dim.z);
  popMatrix();

  pushMatrix(); // pole 1
  translate(pos.x-dim.x/2+bS/2+polePos, pos.y-maxh/2, pos.z-w/2+bS/2);
  box(bS, maxh, bS);
  popMatrix();

  pushMatrix(); // pole 2
  translate(pos.x-dim.x/2+bS/2+polePos, pos.y-maxh/2, pos.z+w/2-bS/2);
  box(bS, maxh, bS);
  popMatrix();

  pushMatrix(); // crossbeam
  translate(pos.x-dim.x/2-bS/2+polePos, h, pos.z);
  box(bS, 2*bS, w);
  popMatrix();

  pushMatrix(); // turning arm
  translate(pos.x-dim.x/2-bS+polePos, h, pos.z+w/2-bS/2);
  rotateY(clamp);
  translate(polePos-lt/2+0.5f*bS, 0, 0);
  box(lt+bS, bS*2, bS);
  popMatrix();

  pushMatrix(); // fixed arm
  translate(pos.x-dim.x/2-bS/2+polePos-lf/2-0.5f*bS, h, pos.z-w/2+bS/2);
  box(lf, bS*2, bS);
  popMatrix();

  pushMatrix(); // ball
  if (!hold) translate(pos.x-dim.x/2-bS/2+polePos-lf/2-0.5f*bS, 0, pos.z);
  else translate(pos.x-dim.x/2-bS/2+polePos-lf/2-0.5f*bS, h-ih, pos.z);
  sphere(6.5f*scale);
  popMatrix();
  
  pushMatrix(); // fixed arm lip front
  translate(pos.x-dim.x/2-3*bS/4+polePos-lf, h-1.5f*bS, pos.z-w/2+bS/2);
  box(bS/2, bS, bS);
  popMatrix();
  
  pushMatrix(); // fixed arm lip back
  translate(pos.x-dim.x/2-3*bS/4+polePos-lf+bS, h-3*bS, pos.z-w/2+bS/2);
  box(bS/2, bS*4, bS);
  popMatrix();
}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Robot1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
