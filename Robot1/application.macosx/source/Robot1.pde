import queasycam.*;

QueasyCam cam; 

float scale = 8;
PVector pos = new PVector(0, 0, 0);
PVector dim = new PVector(28*scale, 4*scale, 28.3*scale);
float maxh = 72*scale;
float polePos = 0*scale;
float h = -1.5*dim.y;
float ih = -1.5*dim.y;
float lf = 15*scale+polePos;
float lt = 13*scale+polePos;
float clamp = 0;
float bS = 2.5*scale; // beamSize
float w = 13*scale + 2*bS;
boolean hold = false;

void setup() {
  fullScreen(P3D);
  cam = new QueasyCam(this);
}

void draw() {  
  if (keyPressed) {
    if (key == 'r') {
      clamp -= 0.01;
    } else if (key == 't') {
      clamp += 0.01;
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
  translate(polePos-lt/2+0.5*bS, 0, 0);
  box(lt+bS, bS*2, bS);
  popMatrix();

  pushMatrix(); // fixed arm
  translate(pos.x-dim.x/2-bS/2+polePos-lf/2-0.5*bS, h, pos.z-w/2+bS/2);
  box(lf, bS*2, bS);
  popMatrix();

  pushMatrix(); // ball
  if (!hold) translate(pos.x-dim.x/2-bS/2+polePos-lf/2-0.5*bS, 0, pos.z);
  else translate(pos.x-dim.x/2-bS/2+polePos-lf/2-0.5*bS, h-ih, pos.z);
  sphere(6.5*scale);
  popMatrix();
  
  pushMatrix(); // fixed arm lip front
  translate(pos.x-dim.x/2-3*bS/4+polePos-lf, h-1.5*bS, pos.z-w/2+bS/2);
  box(bS/2, bS, bS);
  popMatrix();
  
  pushMatrix(); // fixed arm lip back
  translate(pos.x-dim.x/2-3*bS/4+polePos-lf+bS, h-3*bS, pos.z-w/2+bS/2);
  box(bS/2, bS*4, bS);
  popMatrix();
}