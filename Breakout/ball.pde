class Ball
{
 float x;
 float y;
 
 float velX;
 float velY;
 
 float size;
 
 Ball(float _x, float _y, float _velX, float _velY, float _size)
 {
   x = _x;
   y = _y;
   
   velX = _velX;
   velY = _velY;
   
   size = _size;
 }
 
 void display()
 {
   fill(255);
   ellipse(x, y, size, size);
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
   
   if(y < 0)
   {
     velY *= -1;
   }
   
   if(y > height)
   {
     velY *= -1;
     //velX = random(-15, 15);
     //velY = random(10, 15);
   }
 }
 
 void update()
 {
  display();
  move();
  checkBoundaries();
 }
}