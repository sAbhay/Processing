Ball b[] = new Ball[2];

void setup()
{
  fullScreen(P2D);
  
  for(int i = 0; i < b.length; i++)
  {
    float m = random(10, 60);
    
    b[i] = new Ball(random(width), random(height), m, m*2);
  }
}

void draw()
{
  background(0);
  
  for(int i = 0; i < b.length; i++)
  {
    b[i].update();
    
    for(int j = 0; j < b.length; j++)
    {
     if(i == j) break;
     
     b[i].checkCollision(b[j]);
    }
  }
}