class Particle
{
  float x;
  float y;
  
  float velX;
  float velY;
  
  float size = 20;
  
  float h;
  
 Particle(float _x, float _y, float _velX, float _velY, float _h)
 {
   x = _x;
   y = _y;
   
   velX = _velX;
   velY = _velY;
   
   h = _h;
 }
 
 void display()
 {
  fill(h, 255, 255);
  ellipse(x, y, size, size);
  h++;
  
  if(h > 255)
  {
   h = 0; 
  }
 }
 
 void move()
 {
  x += velX;
  y -= velY;
 }
 
 void checkBoundaries()
 {
  if(x < 0 || x > width)
  {
   velX *= -1;
  }
  
  if(y < 0 || y > height)
  {
   velY *= -1;
  }
 }
 
 void update()
 {
  display();
  move();
  checkBoundaries();
 }
}