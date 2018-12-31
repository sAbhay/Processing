ArrayList<Block> b = new ArrayList<Block>();

int gridWidth = 15;
int gridHeight = 5;

float blockWidth;
float blockHeight = 40;

float sideSpace = 30;

Ball ball;

void setup()
{
  fullScreen();
  noStroke();

  blockWidth = (width - sideSpace * 3)/gridWidth;

  for (int i = 0; i < gridWidth; i++)
  {
    for (int j = 0; j < gridHeight; j++)
    {
      b.add(new Block(sideSpace + i * (blockWidth + 2), sideSpace + j * (blockHeight + 2), blockWidth, blockHeight));
    }
  }

  ball = new Ball(width/2, 50, random(10, 15), random(10, 15), 20);
}

void draw()
{
  background(0);

  ball.update();

  for (int i = 0; i < b.size(); i++)
  {
    b.get(i).display();

    if (ball.x >= b.get(i).x && ball.x <= b.get(i).x + b.get(i).Width && ball.y >= b.get(i).y && ball.y <= b.get(i).y + b.get(i).Height)
    {
      if (ball.x >= b.get(i).x && ball.x <= b.get(i).x + b.get(i).Width)
      {
        //ball.velX *= -1; 
        ball.velY *= -1;
      } else if (ball.y >= b.get(i).y && ball.y <= b.get(i).y + b.get(i).Height)
      {
        ball.velX *= -1;
      }

      b.remove(i);
    }
  }
}