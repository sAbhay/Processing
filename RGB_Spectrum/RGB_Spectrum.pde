void setup()
{
  fullScreen();
  colorMode(RGB);
  noStroke();
  noCursor();
}

void draw()
{
  for (int i = 0; i < 256; i++)
  {
    for (int j = 0; j < 256; j++)
    {
      {
        fill(i, j, 255, 127.5);
        ellipse(i * width/255, j * height/255, 2 * width/255, 2 * height/255);

        fill(i, 255, 255-j, 127.5);
        ellipse(i * width/255, j * height/255, 2 * width/255, 2 * height/255);

        fill(255, 255-i, 255-j, 127.5);
        ellipse(i * width/255, j * height/255, 2 * width/255, 2 * height/255);
      }
    }
  }
}