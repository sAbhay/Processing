import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

ArrayList<bullet> b = new ArrayList<bullet>();
ArrayList<particle> p = new ArrayList<particle>();

float angle = 180;

boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;

boolean mouseIsPressed;
boolean mouseReleased;

int time;

boolean rotateUp;
boolean rotateDown;

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
boolean hit = false;

int screenState = 0;

float direction;

float rButtonX;
float rButtonY;
float rButtonWidth;
float rButtonHeight = 60;
String rButtonText = "Reset";

Player player1;
randomPlayer randomPlayer1;

float d;
float d1;

Minim menu;
AudioPlayer menuSound;

Minim game;
AudioPlayer gameSound;

void setup()
{
  fullScreen(P2D);

  time = millis();

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
  rButtonY = height - 100;
  
  menu = new Minim(this);
  menuSound = menu.loadFile("menu.mp3");

  game = new Minim(this);
  gameSound = game.loadFile("game.mp3");
}

void draw()
{ 
  for (int i = 0; i < b.size() - 1; i++)
  {
    b.get(i+1).update();

    d = dist(b.get(i+1).pos.x, b.get(i+1).pos.y, player1.x, player1.y);
    d1 = dist(b.get(i+1).pos.x, b.get(i+1).pos.y, randomPlayer1.x, randomPlayer1.y);

    if (counting) 
    { 
      secCounter = b.size() - 2;
    }

    if (d < 60)
    { 
      b.get(i+1).pos.x = player1.x;
      b.get(i+1).pos.y = player1.y;

      playerStop();

      hit = true;

      b.get(i+1).fill = 0;

      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
    } else if (d1 < 60)
    { 
      b.get(i+1).pos.x = randomPlayer1.x;
      b.get(i+1).pos.y = randomPlayer1.y;

      randomPlayerStop();

      hit = true;

      b.get(i+1).fill = 0;

      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
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

        player1.x = random(width/2, width);
        player1.y = random(height/2, height);

        randomPlayer1.x = random(0, width);
        randomPlayer1.y = random(0, height);

        hit = false;
      }
    }
  }

  for (int j = 0; j < p.size() - 1; j++)
  {
    p.get(j+1).update();

    if (keyPressed)
    {
      if (key == 'r')
      {
        p.get(j).kill = true;
      }

      if (p.get(j).kill)
      {
        p.remove(j);
      }
    }

    if (j > 100)
    {
      j = 100;

      p.get(j).kill = true;

      if (p.get(j).kill)
      {
        p.remove(j);
      }
    }

    if (d < 60)
    {
      player1.size = 3000/(j + 1);
    } else {
     player1.size = 50; 
    }
  }

  if (hit)
  {
    counting = false;
  } else {
    counting = true;
  }

  if (screenState == 0)
  {
    //menuSound.play();
    //gameSound.pause();
    
    background(0);

    fill(255);
    textSize(108);
    text("Shots Fired", width/2, 150);

    button(width/2 + width/4.5, 500, 60, 1, "Dodge");
    button(width/2 + width/4.5, 575, 60, 2, "Shoot");
    button(width/2 + width/4.5, 650, 60, 3, "Two Player");

    fill(128, 255, 0);
    ellipse(250, 460, 250, 250);

    strokeWeight(10);
    stroke(255, 0, 0);
    line(250, 460, 365, 500);

    fill(255);
    strokeWeight(1);
    stroke(255);
    ellipse(465, 535, 20, 20);
    //ellipse(565, 450, 20, 20);
    //ellipse(365, 600, 20, 20);

    noStroke();

    fill(255, 128, 0);
    ellipse(715, 630, 50, 50);

    fill(255, 128, 0, 95);
    ellipse(725, 620, 50, 50);

    fill(255, 128, 0, 90);
    ellipse(735, 610, 50, 50);

    fill(255, 128, 0, 85);
    ellipse(745, 600, 50, 50);

    fill(255, 128, 0, 80);
    stroke(255, 128, 0, 80);
    ellipse(755, 590, 50, 50);

    fill(255, 128, 0, 75);
    ellipse(765, 580, 50, 50);

    fill(255, 128, 0, 70);
    ellipse(775, 570, 50, 50);

    fill(255, 128, 0, 65);
    ellipse(785, 560, 50, 50);

    fill(255, 128, 0, 60);
    ellipse(795, 550, 50, 50);

    fill(255, 128, 0, 55);
    ellipse(805, 540, 50, 50);

    strokeWeight(1);

    hit = false;
  } 

  if (screenState == 1)
  { 
    //menuSound.pause();
    //gameSound.play();
    
    rButton();

    button(width - 100, height - 100, 60, 0, "||");

    textSize(32);
    fill(255);
    text(secCounter, width - 100, 100); 

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
    //player1.mouseMove();

    randomPlayer1.x = -100;
    randomPlayer1.y = -100;

    playerMove();

    if (time<millis() && counting)
    {
      pushMatrix();
      translate(shotPos.x, shotPos.y);

      PVector player = new PVector(shotPos.x, shotPos.y);
      PVector center = new PVector(0, 0);

      b.add(new bullet(player, center));
      
      if(secCounter <= 75)
      {
      time += 1000 - secCounter * 10;
      } else
      {
       time += 250; 
      }

      popMatrix();
    }
  }

  if (screenState == 2)
  { 
    //menuSound.pause();
    //gameSound.play();
    
    direction = random(1, 4);

    rButton();

    button(width - 100, height - 100, 60, 0, "||");

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

    randomPlayer1.initialize();

    player1.x = -100;
    player1.y = -100;

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
    //menuSound.pause();
    //gameSound.play();
    
    rButton();

    button(width - 100, height - 100, 60, 0, "||");

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

    player1.initialize();
    //player1.mouseMove();

    randomPlayer1.x = -100;
    randomPlayer1.y = -100;

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

void keyPressed()
{
  if (key=='w')
  {
    upPressed = true;
  }

  if (key=='s')
  {
    downPressed = true;
  }

  if (key=='a')
  {
    leftPressed = true;
  }

  if (key=='d')
  {
    rightPressed = true;
  }

  if (key == 'r')
  { 
    hit = false;

    player1.x = random(width/2, width);
    player1.y = random(height/2, height);

    player1.velX = 0;
    player1.velY = 0;

    randomPlayer1.x = random(width);
    randomPlayer1.y = random(height);

    randomPlayer1.velX = 0;
    randomPlayer1.velY = 0;

    time = millis();
  }

  if (screenState != 0 && screenState != 1)
  {
    if (key == ' ' && time < millis() && counting)
    {
      PVector player = new PVector(aimPos.x, aimPos.y);
      PVector center = new PVector(width/2, height/2);

      b.add(new bullet(player, center));

      if (screenState == 2)
      {
        time += random(1000);
      }

      if (screenState == 3)
      {
        time += 1000;
      }
    }

    if (key == ESC)
    {
      key = 0;
    }


    if (screenState == 1)
    {
      if (keyCode == UP)
      {
        upPressed = true;
      }

      if (keyCode == DOWN)
      {
        downPressed = true;
      }

      if (keyCode == LEFT)
      {
        leftPressed = true;
      }

      if (keyCode == RIGHT)
      {
        rightPressed = true;
      }
    }

    if (screenState == 2||screenState == 3)
    {
      if (keyCode == UP)
      {
        rotateUp = true;
      }

      if (keyCode == DOWN)
      {
        rotateDown = true;
      }
    }
  }
}


void playerMove()
{
  if (upPressed)
  {
    player1.up();
  }

  if (downPressed)
  {
    player1.down();
  }

  if (leftPressed)
  {
    player1.left();
  }

  if (rightPressed)
  {
    player1.right();
  }
}

void keyReleased()
{
  if (key=='w')
  {
    upPressed = false;
  }

  if (key=='s')
  {
    downPressed = false;
  }

  if (key=='a')
  {
    leftPressed = false;
  }

  if (key=='d')
  {
    rightPressed = false;
  }

  if (key == CODED)
  {
    if (screenState == 1)
    {
      if (keyCode == UP)
      {
        upPressed = false;
      }

      if (keyCode == DOWN)
      {
        downPressed = false;
      }

      if (keyCode == LEFT)
      {
        leftPressed = false;
      }

      if (keyCode == RIGHT)
      {
        rightPressed = false;
      }
    }

    if (screenState == 2||screenState == 3)
    {
      if (keyCode == UP)
      {
        rotateUp = false;
      }

      if (keyCode == DOWN)
      {
        rotateDown = false;
      }
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

  randomPlayer1.velX += 0;
  randomPlayer1.velY += 0;
}

void button(float x1, float y1, int buttonHeight, int number, String buttonText)
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