class Player
{
  float x;
  float y;
  float z;
  
  float velX = 0;
  float velY = 0;
  float velZ = 0;
  
  int r;
  int g;
  int b;
  
  float radius = 6;
  float sphereSize = 20;
  
  void initialize()
  {
    sphereDetail(30);
    
    translate(x, y, z);
    stroke(g, b, r);
    fill(g, b, r);
    sphere(radius);
    stroke(r, g, b, 50);
    fill(255, 0);
    sphere(sphereSize);
    
    x += velX;
    y -= velY;
    z += velZ;
    
    if(velX > 25)
    {
      velX = 25;
    }
    
    if(velY > 25)
    {
     velY = 25; 
    }
    
    if(velZ > 25)
    {
     velZ = 25; 
    }
    
    velX *= 0.975;
    velY *= 0.975;
    velZ *= 0.975;
    
    checkBoundaries();
  }
  
  void checkBoundaries()
  {
    if(x > 270 - z)
    {
     x = 270 - z;
     velX *= -1;
    }
    
    if(x < -270 + z)
    {
     x = -270 + z; 
     velX *= -1;
    }
    
    if(y > 169 - z)
    {
     y = 169 - z;
     velY *= -1;
    }
    
    if(y < -169 + z)
    {
     y = -169 + z;
     velY *= -1;
    }
    
    if(z > 200)
    {
      z = 200;
      velZ *= -1;
    }
    
    if(z < -200)
    {
      z = -200;
      velZ *= -1;
    }
  }
  
  void up()
  {
    velY += 0.25;
  }
  
  void down()
  {
    velY -= 0.25;
  }
  
  void right()
  {
    velX += 0.25;
  }
  
  void left()
  {
    velX -= 0.25;
  }
  
  void increaseDepth()
  {
    velZ += 0.25;
  }
  
  void decreaseDepth()
  {
    velZ -= 0.25;
  }
}