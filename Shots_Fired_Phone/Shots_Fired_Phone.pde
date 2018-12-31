ArrayList<bullet> b = new ArrayList<bullet>();

float angle = 180;

int time;

boolean rotateUp;
boolean rotateDown;

//PImage explosion;

PVector center;
PVector playerPos;
PVector pos;
PVector shotPos;
PVector linePos;
PVector middle;

PVector aimPos;

float rot = 0;
float inc = 4;

int secCounter;
boolean counting;

int screenState = 0;

float direction;

float rButtonX;
float rButtonY;
float rButtonWidth;
float rButtonHeight = 60;
String rButtonText = "Reset";

float dBX;
float dBY;
float dBWidth = 100;
float dBHeight = 100;
String dBText = "v";

float uBX;
float uBY;
float uBWidth = 100;
float uBHeight = 100;
String uBText = "^";

float fBX;
float fBY;
float fBWidth = 100;
float fBHeight = 100;
String fBText = "O";

Player player1;
randomPlayer randomPlayer1;

void setup()
{
  fullScreen(P2D);

  time = millis();

  //explosion = loadImage("explosion.png");
  //explosion.resize(300, 300);

  center = new PVector(0, 0);
  middle = new PVector(width/2, height/2);

  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  player1 = new Player();
  randomPlayer1 = new randomPlayer();

  player1.x = random(width/2, width);
  player1.y = random(height/2, height);

  randomPlayer1.x = random(width);
  randomPlayer1.y = random(height);

  randomPlayerMove();

  aimPos = new PVector(0, 0);
  aimPos.x = width/2;
  aimPos.y = height/2 - 50;

  rButtonX = 100;
  rButtonY = height/2;
  
  uBX = 100;
  uBY = height - 200;
  
  dBX = 100;
  dBY = height - 100;
  
  fBX = width - 100;
  fBY = height - 150;
}

void draw()
{ 
  for (int i = 0; i < b.size() - 1; i++)
  {
    b.get(i+1).update();

    float d = dist(b.get(i+1).pos.x, b.get(i+1).pos.y, player1.x, player1.y);

    if (counting) 
    { 
      secCounter = b.size() - 2;
    }

    if (d < 60)
    {
      //image(explosion, player1.x, player1.y);

      b.get(i+1).pos.x = player1.x;
      b.get(i+1).pos.y = player1.y;

      playerStop();

      counting = false;
    }

    if (keyPressed)
    {
      if (key == 'r')
      {
        b.get(i+1).kill = true;

        time = millis();

        if (b.get(i+1).kill)
        {
          b.remove(i+1);
        }
      }
    }

    if (screenState == 0)
    {
      b.get(i+1).kill = true;

      time = millis();

      if (b.get(i+1).kill)
      {
        b.remove(i+1);
      }
    }

    if (mouseX>=(rButtonX-(rButtonWidth/2))&&mouseY>=(rButtonY-(rButtonHeight/2))&&mouseX<=(rButtonX+(rButtonWidth/2))&&mouseY<=(rButtonY+(rButtonHeight/2)))
    {
      if (mousePressed)
      {
        b.get(i+1).kill = true;

        time = millis();

        if (b.get(i+1).kill)
        {
          b.remove(i+1);
        }
      }
    }
  }

  if (screenState == 0)
  {
    background(0);
    button(width/2, 300, 60, 1, "Dodge");
    button(width/2, 375, 60, 2, "Shoot");
    button(width/2, 450, 60, 3, "Two Player");
  } 

  if (screenState == 1)
  { 
    rButton();

    button(width - 100, height/2, 60, 0, "||");

    textSize(32);
    fill(255);
    text(secCounter, width - 100, 100); 

    counting = true;

    playerPos = new PVector(player1.x, player1.y);

    pos = PVector.sub(playerPos, center);

    shotPos = new PVector(pos.x, pos.y);
    shotPos.normalize();
    shotPos.mult(50);

    linePos = PVector.sub(shotPos, center);

    fill(0, 0, 0, 75);
    rect(width/2, height/2, width, height);

    stroke(1);
    fill(128, 255, 0);
    ellipse(0, 0, 100, 100);
    fill(255, 0, 0);

    strokeWeight(5);
    stroke(255, 0, 0);
    line(center.x, center.y, linePos.x, linePos.y);
    strokeWeight(1);

    player1.initialize();

    playerMove();

    if (time<millis() && counting)
    {
      pushMatrix();
      translate(shotPos.x, shotPos.y);

      PVector player = new PVector(shotPos.x, shotPos.y);
      PVector center = new PVector(0, 0);

      b.add(new bullet(player, center));
      time += random(1000);

      popMatrix();
    }
  }

  if (screenState == 2)
  { 
    direction = random(1, 4);

    rButton();
    fButton();
    uButton();
    dButton();

    button(width - 100, height/2, 60, 0, "||");

    fill(0, 0, 0, 75);
    rect(width/2, height/2, width, height);

    stroke(1);
    fill(128, 255, 0);
    ellipse(width/2, height/2, 100, 100);
    fill(255, 0, 0);

    strokeWeight(5);
    stroke(255, 0, 0);
    line(width/2, height/2, aimPos.x, aimPos.y);
    strokeWeight(1);

    textSize(32);
    fill(255);
    text(secCounter, width - 100, 100); 

    counting = true;

    randomPlayer1.initialize();

    randomPlayerMove();

    if (rotateUp)
    {
      rotateUp();
    }

    if (rotateDown)
    {
      rotateDown();
    }
  }

  if (screenState == 3)
  { 
    rButton();
    fButton();
    uButton();
    dButton();

    button(width - 100, height/2, 60, 0, "||");

    fill(0, 0, 0, 75);
    rect(width/2, height/2, width, height);

    stroke(1);
    fill(128, 255, 0);
    ellipse(width/2, height/2, 100, 100);
    fill(255, 0, 0);

    strokeWeight(5);
    stroke(255, 0, 0);
    line(width/2, height/2, aimPos.x, aimPos.y);
    strokeWeight(1);

    textSize(32);
    fill(255);
    text(secCounter, width - 100, 100); 

    counting = true;

    player1.initialize();

    playerMove();

    if (rotateUp)
    {
      rotateUp();
    }

    if (rotateDown)
    {
      rotateDown();
    }
  }
}



void playerMove()
{
  if (mousePressed)
  {
    if (mouseX >= player1.x - 50 && mouseX <= player1.x + 50 && mouseY >= player1.y - 50 && mouseY <= player1.y + 50)
    {
      player1.x = mouseX;
      player1.y = mouseY;
    }
  }
}

void playerStop()
{
  player1.velX = 0;
  player1.velY = 0;

  if (keyPressed)
  {
    player1.velX += 0;
    player1.velY += 0;
  }
}

void randomPlayerStop()
{
  randomPlayer1.velX = 0;
  randomPlayer1.velY = 0;

  if (keyPressed)
  {
    randomPlayer1.velX += 0;
    randomPlayer1.velY += 0;
  }
}

void button(int x1, int y1, int buttonHeight, int number, String buttonText)
{
  float buttonWidth = buttonText.length() * 13 * 1.5384615385;
  fill(255, 0);
  stroke(255, 0);
  rect(x1, y1, buttonWidth, buttonHeight);
  fill(255);
  textSize(30);
  text(buttonText, x1, y1);
  if (mouseX>=(x1-(buttonWidth/2))&&mouseY>=(y1-(buttonHeight/2))&&mouseX<=(x1+(buttonWidth/2))&&mouseY<=(y1+(buttonHeight/2)))
  {
    if (mousePressed)
    {
      screenState = number;
      time = millis();

      secCounter = 0;
    }
  }
}

void randomPlayerMove()
{
  if (direction <= 1)
  {
    randomPlayer1.up();
  }

  if (direction <= 2 && direction > 1)
  {
    randomPlayer1.down();
  }

  if (direction <= 3 && direction > 2)
  {
    randomPlayer1.left();
  }

  if (direction <= 4 && direction > 3)
  {
    randomPlayer1.right();
  }
}

void rotateDown()
{
  rot -= inc;
  aimPos.x = width/2 + cos(radians(rot))*50;
  aimPos.y = height/2 + sin(radians(rot))*50;
}

void rotateUp()
{
  rot += inc;
  aimPos.x = width/2 + cos(radians(rot))*50;
  aimPos.y = height/2 + sin(radians(rot))*50;
}

void rButton()
{
  rButtonWidth = rButtonText.length() * 13 * 1.5384615385;
  fill(255, 0);
  stroke(255, 0);
  rect(rButtonX, rButtonY, rButtonWidth, rButtonHeight);
  fill(255);
  textSize(30);
  text(rButtonText, rButtonX, rButtonY);
}

void uButton()
{
  fill(255, 0);
  stroke(255, 0);
  rect(uBX, uBY, uBWidth, uBHeight);
  fill(255);
  textSize(60);
  text(uBText, uBX, uBY);
}

void dButton()
{
  fill(255, 0);
  stroke(255, 0);
  rect(dBX, dBY, dBWidth, dBHeight);
  fill(255);
  textSize(60);
  text(dBText, dBX, dBY);
}

void fButton()
{
  fill(255, 0);
  stroke(255, 0);
  rect(fBX, fBY, fBWidth, fBHeight);
  fill(255);
  textSize(60);
  text(fBText, fBX, fBY);
}

void mousePressed()
{
  if (screenState != 0 || screenState != 1)
  {
    if (mouseX>=(fBX-(fBWidth/2))&&mouseY>=(fBY-(fBHeight/2))&&mouseX<=(fBX+(fBWidth/2))&&mouseY<=(fBY+(fBHeight/2)))
    {
      PVector player = new PVector(aimPos.x, aimPos.y);
      PVector center = new PVector(width/2, height/2);

      b.add(new bullet(player, center));
      time += 1000;
    }

    if (mouseX>=(dBX-(dBWidth/2))&&mouseY>=(dBY-(dBHeight/2))&&mouseX<=(dBX+(dBWidth/2))&&mouseY<=(dBY+(dBHeight/2)))
    {
      rotateDown = true;
    }

    if (mouseX>=(uBX-(uBWidth/2))&&mouseY>=(uBY-(uBHeight/2))&&mouseX<=(uBX+(uBWidth/2))&&mouseY<=(uBY+(uBHeight/2)))
    {
      rotateUp = true;
    }
  }
}

void mouseReleased()
{
  if (mouseX>=(dBX-(dBWidth/2))&&mouseY>=(dBY-(dBHeight/2))&&mouseX<=(dBX+(dBWidth/2))&&mouseY<=(dBY+(dBHeight/2)))
  {
    rotateDown = false;
  }

  if (mouseX>=(uBX-(uBWidth/2))&&mouseY>=(uBY-(uBHeight/2))&&mouseX<=(uBX+(uBWidth/2))&&mouseY<=(uBY+(uBHeight/2)))
  {
    rotateUp = false;
  }
}