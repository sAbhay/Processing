int x[] = new int[60];
int y[] = new int[60];

int velX[] = new int[60];
int velY[] = new int[60];

void setup()
{
  fullScreen();
  colorMode(HSB);

  for (int i = 0; i < x.length; i++)
  {
    x[i] = (int) random(width);
    y[i] = (int) random(height);
    
    velX[i] = (int) random(20);
    velY[i] = (int) random(20);
  }
}

void draw()
{
  background(random(255));
  
  for (int i = 0; i < x.length; i++)
  {   
    fill(random(255), 255, 255);
    ellipse(x[i], y[i], 20, 20);
    
    x[i] += velX[i];
    y[i] -= velY[i];
    
    if(x[i] > width || x[i] < 0)
    {
      velX[i] *= -1;
    }
    
    if(y[i] > height || y[i] < 0)
    {
      velY[i] *= -1;
    }
  }
}