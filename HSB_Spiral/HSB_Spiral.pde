float rot;

//change these numbers to alter the patterns
float rotSpeed = 3000;

float d = 0.25;

float[] y = {5, -5, 900, -900};
float[] h = new float[4];

void setup()
{
  //fullScreen(P2D);
  size(900, 900, P2D);
  background(0);
  noStroke();

  colorMode(HSB);

  rectMode(CENTER);

  //for (int i = 0; i < h.length; i++)
  //{
    h[0] = (int) random(255);
    h[1] = h[0] + (int) random(-50, 50);
    
    h[2] = (int) random(255);
    h[3] = h[2] + (int) random(-50, 50);
  //}
}

void draw()
{
  translate(width/2, height/2);

  if (y[2] != 0 && y[3] != 0)
  {
    rotate(rot);
    rot+=rotSpeed;

    y[0] += d;
    y[1] -= d;
    //y[2] -= d;
    //y[3] += d;
  }

  for(int i = 0; i < 4; i++)
  {
    fill(h[i], 255, 255);
    ellipse(0, y[i], 25, 25);
    h[i] += 0.5;
    
    if(h[i] > 255)
    {
     h[i] = 0; 
    }
  }
}