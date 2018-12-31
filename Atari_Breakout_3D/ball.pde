class Ball
{
 PVector pos;
 PVector dir;
 
 float speed;
 float size;
 
 PShape sphere;
 
 Ball(PVector _start, PVector _target)
 {
   pos = new PVector(_start.x, _start.y, _start.z);
   dir = new PVector(_target.x, _target.y, _target.z);
   
   dir = PVector.sub(_target, _start);
   
   speed = 20;
   size = 5;
   
   sphere = createShape(SPHERE, size);
   sphere.beginShape();
   sphere.noStroke();
   sphere.fill(255);
   sphere.endShape();
 }
 
 void display()
 {
   pushMatrix();
  
  translate(pos.x, pos.y, pos.z);
  shape(sphere);
  
  popMatrix();
 }
 
 void move()
 {
   pos.add(dir);
 }
 
 void checkBoundaries()
 {
  if(pos.x <= 0 || pos.x >= width)
  {
   dir.x *= -1; 
  }
  
  if(pos.y <= 0 || pos.y >= height)
  {
   dir.y *= -1; 
  }
  
  if(pos.z <= -range)
  {
   dir.z *= -1; 
  }
 }
 
 void bounce()
 {
   dir.x *= pos.x - paddle.x;
   dir.y *= pos.y - paddle.y;
   dir.z *= -1;
   
   speed = (dist(pos.x, pos.y, paddle.x, paddle.y))/2;
   
   dir.normalize();
   dir.mult(speed);
 }
 
 void update()
 {
   display();
   move();
   checkBoundaries();
 }
}