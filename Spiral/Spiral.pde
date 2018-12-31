float rot;

//change these numbers to alter the patterns
float rotSpeed = 3000;
float y1 = 5;
float y2 = -5;
float y3 = 900;
float y4 = -900;
float d = 0.5;

void setup()
{
  fullScreen(P2D);
  background(0);
  noStroke();

  rectMode(CENTER);
}

void draw()
{
  translate(width/2, height/2);

  if (y3 != 0 && y4 != 0)
  {
    rotate(rot);
    rot+=rotSpeed;

    y1 += d;
    y2 -= d;
    y3 -= d;
    y4 += d;
  }

  fill(0, 128, 255);
  ellipse(0, y3, 25, 25);
  ellipse(0, y1, 25, 25);

  fill(128, 255, 0);
  ellipse(0, y4, 25, 25);
  ellipse(0, y2, 25, 25);
}