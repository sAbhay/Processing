PImage l[] = new PImage[7];
PImage r[] = new PImage[l.length];
int num = 0;

//language, family structure, food, city layouts, politics, movies

void setup()
{
  for (int i = 0; i < l.length*2; i++)
  {
    if ((i % 2) == 0) l[i/2] = loadImage(i+".png");
    else r[(int) i/2] = loadImage(i+".png");
  }

  for (int i = 0; i < l.length; i++)
  {
    l[i].resize(width/2, height);
    r[i].resize(width/2, height);
  }

  fullScreen();
  
   background(0);

    image(l[num], 0, 0);
    image(r[num], width/2, 0);

    stroke(0);
    strokeWeight(5);
    line(width/2, 0, width/2, height);
}

void draw()
{
  PImage img = get(0, 0, width, height);
  img.save(num+".png");
  num++;
  
  if (num > l.length) exit();
  else
  {
    background(0);

    image(l[num-1], 0, 0);
    image(r[num-1], width/2, 0);

    stroke(0);
    strokeWeight(5);
    line(width/2, 0, width/2, height);
  }
}