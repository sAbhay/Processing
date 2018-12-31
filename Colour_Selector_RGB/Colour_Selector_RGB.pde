int mode = 0;

void setup()
{
  fullScreen();
  colorMode(RGB);
  noStroke();

  background(0);
}

void draw()
{ 
  for (int i = 0; i < 256; i++)
  {
    for (int j = 0; j < 256; j++)
    {
      {
        switch(mode)
        {
        case 3:
          fill(255-i, 255-j, 255);
          ellipse(i * width/255 * 0.5 + width/2, j * height/255 * 0.5 + height/2, width/255, height/255);
          
          fill(j, 255, i);
          ellipse(i * width/255 * 0.5, j * height/255 * 0.5 , width/255, height/255);
          
          fill(255, 255-j, i);
          ellipse(i * width/255 * 0.5, j * height/255 * 0.5 + height/2, width/255, height/255);
          
          fill(0);
          ellipse(i * width/255 * 0.5 + width/2, j * height/255 * 0.5, width/255, height/255);
          break;

        case 1:
          fill(i, 255, 255-j);
          ellipse(i * width/255, j * height/255, 2 * width/255, 2 * height/255);
          break;

        case 2:
          fill(255, 255-i, 255-j);
          ellipse(i * width/255, j * height/255, 2 * width/255, 2 * height/255);
          break;

        case 0:
          fill(i, j, 255);
          ellipse(i * width/255, j * height/255, 2 * width/255, 2 * height/255);
          break;
        }
      }
    }
  }
}

void mousePressed()
{
  if (mouseButton == RIGHT)
  {
    mode++;

    if (mode > 3)
    {
      mode = 0;
    }
  }
}