class Projectile
{
 PVector pos;
 PVector dir;
 
 PVector start;
 PVector target;
 
 float Width;
 float Height;
 
 Projectile(PVector _start, PVector _target, float _Width, float _Height)
 {
   pos = new PVector(0, 0);
   dir = new PVector(0, 0);
   
   start = _start;
   target = _target;
   
   Width = _Width;
   Height = _Height;
 }
 
 void display()
 {
  ellipse(pos.x, pos.y, Width, Height); 
 }
 
 void move()
 {
   
 }
}