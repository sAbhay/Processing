import queasycam.*;

//scale: 10px/cm

float l = 650; //length
float bw = 50; //bar width/dimensions
float bl = 400; //blade length
float y = l - bw/2; //amount raised/lowered
float w = 400; // width
float cl = 0; //clamp
float r = 0; //rotation

QueasyCam cam;

void setup()
{
  fullScreen(P3D);

  cam = new QueasyCam(this);
}

void draw()
{
  background(0);

  pushMatrix();
  translate(0, l/3 - bw/2, 0);
  box(bw, 2*l/3, bw);
  popMatrix();

  pushMatrix();
  //rotateX(r);

  pushMatrix();
  translate(0, l/2, 0);
  box(bw, l, bw);
  popMatrix();

  pushMatrix();
  translate(0, y, 0);
  box(w, bw, bw);
  popMatrix();

  pushMatrix();
  translate(-w/2 + 0.25*bw + cl, y, -bl/2);
  box(bw/2, bw, bl);
  popMatrix();

  pushMatrix();
  translate(w/2 - 0.25*bw - cl, y, -bl/2);
  box(bw/2, bw, bl);
  popMatrix();

  pushMatrix();
  translate(-w/2 + 0.25*bw + cl, y + bl/4, -0.75*bl);
  box(bw/2, bl/2, bw);
  popMatrix();

  pushMatrix();
  translate(w/2 - 0.25*bw - cl, y + bl/4, -0.75*bl);
  box(bw/2, bl/2, bw);
  popMatrix();

  pushMatrix();
  translate(-w/2 + bl/12 + cl, y + bl/2 - bw/20, -0.75*bl);
  box(bl/6, bw/10, bw);
  popMatrix();

  pushMatrix();
  translate(w/2 - bl/12 - cl, y + bl/2 - bw/20, -0.75*bl);
  box(bl/6, bw/10, bw);
  popMatrix();
  
  pushMatrix();
  translate(-w/3 + bw/2, y + bl/4, -bw/2.5);
  box(bw, bl/2, bw/5);
  popMatrix();
  
  pushMatrix();
  translate(w/3 - bw/2, y + bl/4, -bw/2.5);
  box(bw, bl/2, bw/5);
  popMatrix();

  popMatrix();

  if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        y-=1;
      }
      if (keyCode == DOWN)
      {
        y+=1;
      }

      if (keyCode == LEFT)
      {
        cl-=1;
      }

      if (keyCode == RIGHT)
      {
        cl+=1;
      }
    }
  }
}