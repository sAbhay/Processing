class Block
{
 float x;
 float y;
 
 float Width;
 float Height;
 
 Block(float _x, float _y, float _Width, float _Height)
 {
   x = _x;
   y = _y;
   
   Width = _Width;
   Height = _Height;
 }
 
 void display()
 {
  fill(255);
  
  rect(x, y, Width, Height);
 }
}