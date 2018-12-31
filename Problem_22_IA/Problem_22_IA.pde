int num = 30;
int collisions = 0;

Ball b[] = new Ball[2*num];

void setup()
{
  fullScreen();

  for (int i = 0; i < num; i++)
  {
    if (i < num/2)
    {
      b[i] = new Ball(30 + i*30, 2, color(255));
    } else
    {
      b[i] = new Ball(width - (30 + i*30), -2, color(0));
    }
  }
}

void draw()
{
  background(255);
  
  for (int i = 0; i < num; i++)
  {
    b[i].update();

    for (int j = 0; j < num; j++)
    {
      if (i != j)
      {
        if (b[i].checkCollision(b[j]))
        {
          collisions++;
        }
      }
    }
  }
  
  println(collisions);
}