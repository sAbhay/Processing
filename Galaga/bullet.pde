class bullet
{

  float posX;
  float posY;

  float velX;
  float velY;

  float size;

  bullet()
  {
    
    posX = shotX;
    posY = shotY;

    velX = 0;
    velY = 20;

    size = 20;
    
  }

  void display()
  {
    fill(255);
    ellipse(posX, posY, size, size);
  }

  void move()
  {
    posX+=velX;
    posY+=velY;
  }
  
  void update()
  {
    move();
    display();
  }
}