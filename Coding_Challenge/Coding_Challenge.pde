int colourScheme;

ArrayList<BounceMover> bM = new ArrayList<BounceMover>();
ArrayList<StraightMover> stM = new ArrayList<StraightMover>();
ArrayList<randomMover> rM = new ArrayList<randomMover>();
ArrayList<SpiralMover> spM = new ArrayList<SpiralMover>();

boolean collision;

float d;

float rot = 0;
float rotSpeed = 0.003;

void setup()
{
  fullScreen();

  noStroke();

  background(0);
}

void draw()
{
  //background(0);
  //fill(0, 25);
  //rect(0, 0, width, height);

  if (bM.size() < 50)
  {
    bM.add(new BounceMover(random(width), random(height), random(-15, 15), random(-15, 15), 15, 0, 2));
  }

  if (stM.size() < 25)
  {
    stM.add(new StraightMover(random(width), 0, 0, random(-15, 15), 20, 0, 0));
  }

  if (stM.size() < 25)
  {
    stM.add(new StraightMover(0, random(height), random(-15, 15), 0, 20, 0, 0));
  }

  if (spM.size() < 32)
  {
    pushMatrix();

    translate(width/2, height/2);
    rotate(rot);
    rot += rotSpeed;

    spM.add(new SpiralMover(random(-width/2, width/2), random(height/2), 0, random(20), 20, 0, 5));

    popMatrix();
  }

  if (rM.size() < 70)
  {
    rM.add(new randomMover(random(width), random(height), random(-20, 20), random(-20, 20), random(20), (int) random(2), 3));
  }

  for (int i = 0; i < bM.size() - 1; i++)
  {
    bM.get(i).update();
  }

  for (int i = 0; i < stM.size() - 1; i++)
  {
    stM.get(i).update();
    //stM.get(i).move();
  }

  for (int i = 0; i < spM.size() - 1; i++)
  {
    pushMatrix();

    translate(width/2, height/2);
    rotate(rot);
    rot += rotSpeed;

    //spM.get(i).display();
    //spM.get(i).checkBoundaries();
    spM.get(i).update();
    //spM.get(i).spiralMove();

    popMatrix();
  }

  for (int i = 0; i < rM.size() - 1; i++)
  {
    rM.get(i).update();
  }
}