float scale = 7;
int y;
float posJ = 0;
float posP = 61*scale;
float t = 0;
float dt = 0.1;

PVector sdir = new PVector();

void setup()
{
  fullScreen();
  
  y = height - 100;
}

void draw()
{
  background(255);
  line(0, y, width, y);
  line(101*scale, y, 101*scale, y-10*scale);
  line(61*scale, y, 101*scale, y-10*scale);
  line(141*scale, y, 101*scale, y-10*scale);
  
  //if(t < 50.5) 
  {t += dt;
  posP += 1.3*scale*dt;
  posJ += 2*scale*dt;}
  
  //else println(posP/scale + ", " + posJ/scale);
  
  line(posJ, y, posJ, y-2*scale);
  line(posP, y, posP, y-1.54*scale);
  
  if(posJ >= 61*scale && posJ <= 141*scale)
  {
    sdir = PVector.sub(new PVector(posJ, y), new PVector(101*scale, y-10*scale));
    sdir.normalize();
    sdir.mult(60);
    
    line(101*scale, y-10*scale, posJ + sdir.x, y-scale*2 + sdir.y);
  }
}