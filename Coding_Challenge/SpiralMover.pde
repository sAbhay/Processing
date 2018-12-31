class SpiralMover extends Mover
{
  SpiralMover(float _x, float _y, float _velX, float _velY, float _size, int _reflectType, int _colourScheme)
  {
    super(_x, _y, _velX, _velY, _size, _reflectType, _colourScheme);
  }
  
  void spiralMove()
  {
   pushMatrix();
   
   float rot = 0;
   float rotSpeed = 300;
   
    translate(width/2, height/2);
    
    rotate(rot);
    rot -= rotSpeed;
   
   //super.update();
   
   y += velY;
   
   popMatrix();
  }
}