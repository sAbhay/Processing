PImage img;
int numRec = 3;
PVector recPos = new PVector(846, 251);
PVector scale = new PVector(0.36, 0.45);
PVector finalRes;
int loopCount;

void setup()
{
  img = loadImage("Vatican City.png");
  finalRes = new PVector(img.width, img.height);

  fullScreen();

  img.resize(width, height);

  noCursor();
}

void draw()
{ 
  while (loopCount < numRec)
  {
    image(img, 0, 0);

    PImage img2 = get();

    img2.resize((int)(img.width * scale.x), (int)(img.height * scale.y));

    image(img2, recPos.x, recPos.y);

    img = get();

    loopCount++;
  }

  image(img, 0, 0);

  img.resize((int)finalRes.x, (int)finalRes.y);

  img.save("saved2.png");

  exit();

  //fill(0);
  //rect(mouseX, mouseY - 10, 60, 10);
  //fill(255);
  //text("(" + mouseX + ", " + mouseY, mouseX, mouseY);
}