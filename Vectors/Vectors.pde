PVector v1;
PVector v2;
PVector v3;
PVector v4;

void setup()
{
  fullScreen();
  noStroke();
  
  v1 = new PVector(10, 10);
  v2 = new PVector(width/2, height/2);
}

void draw()
{   
  v3 = new PVector();
  v4 = new PVector();
  
  background(0);
  
  v3 = v1.sub(v2);
  
  v4.x = 1;
  v4.y = (-v3.x)/(v3.y);
  v4.normalize();
  
  v3.add(v4);
  v1.add(v4);
  
  fill(255);
  ellipse(v1.x, v1.y, 50, 50);
}