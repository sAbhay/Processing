
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
    stroke(r, g, b);
    
    //stroke(random(255), random(255), random(255));
    
    strokeWeight(3);
    
    line(0, 0, 0, x, y, z);
  }

  void checkBoundaries()
  { 
    if (x < (-width/2))
     {
     x = width/2;
     }
     
     if (x > width/2)
     {
     x = (-width/2);
     }
     
     if (y < (-height/2))
     {
     y = height/2;
     }
     
     if (y > height/2)
     {
     y = (-height/2);
     }
     
     if(z > 800)
     {
      z = -800; 
     }
     
     if(z < (-800))
     {
      z = 800; 
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