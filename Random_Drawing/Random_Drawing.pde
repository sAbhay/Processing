Bullet blt;
Bullet rana;
Bullet shailen;

void setup()
{

  //size(1000, 700);
  fullScreen();
  background(0);

  blt = new Bullet();
  rana = new Bullet(random(width), random(height), random(6, 15), random(6, 15), random(1, 20));
  shailen = new Bullet(random(width), random(height), random(6, 15), random(6, 15), random(1, 20));
}

void draw()
{
  delay(10);

  blt.update();
  rana.update();
  shailen.update();
}