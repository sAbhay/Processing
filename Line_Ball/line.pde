
class Line
{
  float x;
  float y;
  float z;
  
  float velX = random(-9, 9);
  float velY = random(-9, 9);
  float velZ = random(-9, 9);

  float r;
  float g;
  float b;

  boolean kill = false;

  Line()
  {
    x = 0;
    y = 0;
    z = 0;
  }

  void display()
  {
    //fill(r, g, b);
    stroke(r, g, b, 90);
    
    strokeWeight(3);
    
    line(y, z, x, x, y, z);
  }

  void checkBoundaries()
  { 
    if (x < -2000)
     {
     x = 2000;
     }
     
     if (x > 2000)
     {
     x = -2000;
     }
     
     if (y < -2000)
     {
     y = 2000;
     }
     
     if (y > 2000)
     {
     y = -2000;
     }
     
     if(z > 2000)
     {
      z = -2000; 
     }
     
     if(z < (-2000))
     {
      z = 2000; 
     }

    /*if (x < -20| x > width + 20||y < 0||y > height + 10)
    {
      kill = true;
    }*/
  }

  void move()
  {
    velX = random(-10, 10);
    velY = random(-10, 10);
    velZ = random(-10, 10);

    x += velX;
    y += velY;
    z += velZ;
  }

  void update()
  {
    display();
    checkBoundaries();
    move();
  }
}