class Bullet
{

  float posX;
  float posY;

  float velX;
  float velY;

  float size;

  Bullet()
  {

    posX = random(width);
    posY = random(height);

    velX = 10;
    velY = 10;

    size = 10;
    
  }

  Bullet(float x, float y, float vX, float vY, float s)
  {
    
    posX = x;
    posY = y;
    velX = vX;
    velY = vY;
    size = s;
    
  }

  void display()
  {
    fill(random(255),random(255),random(255));
    ellipse(posX, posY, size, size);
  }

  void move()
  {

    posX+=velX;
    posY-=velY;
    
    velX+=5;
    velY+=5;
  }
  
  void checkBoundaries()
  {
  
     if(posX < 0)
    {velX = velX*-1;}
    
    if(posX > width)
    {velX = velX*-1;}
    
    if(posY < 0)
    {velY = velY*-1;}
    
    if(posY > height)
    {posY = random(height);}
    
  }

void gravity()
{
  posY += 5;
}

  void update()
  {
    move();
    display();
    checkBoundaries();
    gravity();
  }
}