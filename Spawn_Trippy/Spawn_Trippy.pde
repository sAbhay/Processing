float z;

void setup()
{
  fullScreen();
  rectMode(CENTER);
}

void draw()
{
   z = random(30);
   
  for(int x = 0; x < width; x++)
  {
    fill(random(255), random(255), random(255), 125);
    stroke(random(255), random(255), random(255));
    rect(x, random(height), z, z);
    //ellipse(x, random(height), z, z);
  }
}