import queasycam.*;

QueasyCam cam; 

float scale = 8;
PVector pos = new PVector(0, 0, 0);
PVector dim = new PVector(28*scale, 4*scale, 28.3*scale);
float pivh = 36*scale;
float maxh = 72*scale;
float polePos = 5*scale;
float h = -1.5*dim.y;
float ih = -6.5*scale/2;
float lf = 15*scale+polePos;
float lt = 13*scale+polePos;
float clamp = 0;
float rot = 0;
PVector rampDim = new PVector(dim.x, dim.x*1.2, 1*scale);
float bS = 2.5*scale; // beamSize
float w = 13*scale + 2*bS;
boolean hold = false;
boolean rampUp = true;

void setup() {
  fullScreen(P3D);
  cam = new QueasyCam(this);
}

void draw() {  
  if (keyPressed) {
    if (key == 'h') {
      clamp -= 0.02;
    } else if (key == 'j') {
      clamp += 0.02;
    }
    if (key == 'k') {
      if (rot >= 0.02) rot -= 0.02;
    } else if (key == 'l') {
      rot += 0.02;
    }
    if (key == CODED) {
      if (keyCode == UP) {
        h-=2*scale/8;
      } else if (keyCode == DOWN) {
        h+=2*scale/8;
      }
    }
  }

  if (clamp < 0) hold = true;
  else if (clamp == 0) {
    hold = false; 
    ih = -6.5*scale/2;
  } else if (clamp > 0) hold = false;

  background(0); // chassis
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  box(dim.x, dim.y, dim.z);
  popMatrix();

  pushMatrix(); // pole 1
  translate(pos.x-dim.x/2+bS/2+polePos, pos.y-pivh/2, pos.z-w/2+bS/2);
  box(bS, pivh, bS);
  popMatrix();

  pushMatrix(); // pole 2
  translate(pos.x-dim.x/2+bS/2+polePos, pos.y-pivh/2, pos.z+w/2-bS/2);
  box(bS, pivh, bS);
  popMatrix();

  pushMatrix(); // pole 3
  translate(pos.x-dim.x/2+bS/2+polePos, pos.y-(maxh-pivh)+bS/4, pos.z-w/2+bS/2);
  rotateZ(rot);
  translate(0, -0.5*(maxh-pivh), 0);
  box(bS, maxh-pivh+bS/2, bS);
  popMatrix();

  pushMatrix(); // pole 4
  translate(pos.x-dim.x/2+bS/2+polePos, pos.y-(maxh-pivh)+bS/4, pos.z+w/2-bS/2);
  rotateZ(rot);
  translate(0, -0.5*(maxh-pivh), 0);
  box(bS, maxh-pivh+bS/2, bS);
  popMatrix();

  pushMatrix(); // top crossbeam
  translate(pos.x-dim.x/2+bS/2+polePos, pos.y-(maxh-pivh)+bS/4, pos.z+w/2-bS/2);
  rotateZ(rot);
  translate(0, -(maxh-pivh)+bS/4, -w/2+bS/2);
  box(bS, bS, w);
  popMatrix();

  pushMatrix(); // crossbeam
  translate(pos.x-dim.x/2-bS/2+polePos, h, pos.z);
  box(bS, 2*bS, w);
  popMatrix();

  pushMatrix(); // rotating axle
  translate(pos.x-dim.x/2+bS/2+polePos, -pivh, pos.z);
  box(bS, bS, w);
  popMatrix();

  pushMatrix(); // turning arm
  translate(pos.x-dim.x/2+polePos, h, pos.z+w/2-bS/2);
  rotateY(clamp);
  translate(-lt/2-0.5*bS, 0, 0);
  box(lt+bS, bS*2, bS);
  popMatrix();

  pushMatrix(); // fixed arm
  translate(pos.x-dim.x/2-bS/2+polePos-lf/2-0.5*bS, h, pos.z-w/2+bS/2);
  box(lf, bS*2, bS);
  popMatrix();

  pushMatrix(); // ball
  if (!hold) translate(pos.x-4*dim.x/5, ih, pos.z);
  else translate(pos.x-4*dim.x/5, h, pos.z);
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

  if (rampUp) {
    pushMatrix(); // wing ramp 1
    translate(pos.x+4*scale, pos.y-6*scale/2-rampDim.y/2, pos.z+dim.z/2);
    rotateZ(0.2);
    box(rampDim.x, rampDim.y, rampDim.z);
    popMatrix();

    pushMatrix(); // wing ramp 2
    translate(pos.x+4*scale, pos.y-6*scale/2-rampDim.y/2, pos.z-dim.z/2);
    rotateZ(0.2);
    box(rampDim.x, rampDim.y, rampDim.z);
    popMatrix();
  } else {
    pushMatrix(); // wing ramp 3
    translate(pos.x+0*scale, pos.y-6*scale/2, pos.z+dim.z/2+rampDim.x/2);
    rotateZ(0.2);
    rotateX(PI/2);
    box(rampDim.x, rampDim.y, rampDim.z);
    popMatrix();

    pushMatrix(); // wing ramp 4
    translate(pos.x+0*scale, pos.y-6*scale/2, pos.z-dim.z/2-rampDim.x/2);
    rotateZ(0.2);
    rotateX(PI/2);
    box(rampDim.x, rampDim.y, rampDim.z);
    popMatrix();
  }

  //pushMatrix(); // height check
  //translate(pos.x-dim.x/2, -maxh, pos.z);
  //box(200, 1, 200);
  //popMatrix();
}

void keyPressed() {
 if (key == 'r') rampUp = !rampUp; 
}