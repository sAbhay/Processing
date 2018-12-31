float h;
float s;
float b;

void setup()
{
  fullScreen();
  colorMode(HSB);
  noStroke();
}

void draw()
{
  for (int i = 0; i < 256; i++)
  {
    for (int j = 0; j < 256; j++)
    {
      fill(i, j, 255);
      ellipse(i * width/255, j * height/(2*255), 2 * width/255, 2 * height/255); 

      fill(i, 255, 255-j);
      ellipse(i * width/255, j * height/(2*255) + height/2, 2 * width/255, 2 * height/255);
    }
  }

  println(h + ", " + s + ", " + b + ", ");
}

void mouseClicked()
{
  if (mouseY <= height/2)
  {
    h = mouseX/(width/360);
    s = 2*mouseY/(height/255);
    b = 255;
  }
}