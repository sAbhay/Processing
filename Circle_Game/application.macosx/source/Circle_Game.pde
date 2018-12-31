import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim menu;
AudioPlayer menuSound;

Minim game;
AudioPlayer gameSound;

/* 
 Created by Abhay Singhal
 
 screenState = 0 : main menu
 screenState = 1 : two players
 screenState = 2 : pause menu for two players
 screenState = 3 : four players solo
 screenState = 4 : pause menu for four players solo
 screenState = 5 : gamemodes
 screenState = 6 : four players teams
 screenState = 7 : pause menu for four players teams
 screenState = 8 : 
 */

PImage img;

PFont logoFont;

boolean upPressed1;
boolean downPressed1;
boolean rightPressed1;
boolean leftPressed1;
boolean upPressed2;
boolean downPressed2;
boolean rightPressed2;
boolean leftPressed2;
boolean upPressed3;
boolean downPressed3;
boolean rightPressed3;
boolean leftPressed3;
boolean upPressed4;
boolean downPressed4;
boolean rightPressed4;
boolean leftPressed4;

boolean counting=false;
int secCounter;
int z;

int screenState = 0;
int selectedItem = 0;

boolean hit1;
boolean hit2;

Player player1;
Player player2;
Player player3;
Player player4;

void setup()
{
  smooth();
  fullScreen(P2D);

  img = loadImage("explosion.png");
  logoFont = createFont("youregone-italic.ttf", 144);

  menu = new Minim(this);
  menuSound = menu.loadFile("menu.mp3");

  game = new Minim(this);
  gameSound = game.loadFile("game.mp3");

  menuSound.loop();
  gameSound.loop();

  player1 = new Player();
  player2 = new Player();
  player3 = new Player();
  player4 = new Player();
}

void keyReleased()
{

  if (key=='w')
  {
    upPressed1 = false;
  }

  if (key=='s')
  {
    downPressed1 = false;
  }

  if (key=='a')
  {
    leftPressed1 = false;
  }

  if (key=='d')
  {
    rightPressed1 = false;
  }

  if (key==CODED)
  {

    if (keyCode==UP)
    {
      upPressed2=false;
    }

    if (keyCode==DOWN)
    {
      downPressed2=false;
    }

    if (keyCode==RIGHT)
    {
      rightPressed2=false;
    }

    if (keyCode==LEFT)
    {
      leftPressed2=false;
    }
  }

  if (key=='t')
  {
    upPressed3 = false;
  }

  if (key=='f')
  {
    leftPressed3 = false;
  }

  if (key=='g')
  {
    downPressed3 = false;
  }

  if (key=='h')
  {
    rightPressed3 = false;
  }

  if (key=='i')
  {
    upPressed4 = false;
  }

  if (key=='j')
  {
    leftPressed4 = false;
  }

  if (key=='k')
  {
    downPressed4 = false;
  }

  if (key=='l')
  {
    rightPressed4 = false;
  }
}

void draw()
{ 
  imageMode(CENTER);
  img.resize(400, 425);

  player1.r = 0;
  player1.g = 128;
  player1.b = 255;

  player2.r = 128;
  player2.g = 255;
  player2.b = 0;

  if (screenState == 0)
  {
    menuSound.play();
    gameSound.pause();

    background(0);
    counting = false;

    textFont(logoFont, 32);
    fill(255, 34, 0);
    textAlign(CENTER);
    textSize(144);
    text("Circle Game", width/2, height/3.6);

    fill(0, 128, 255);
    ellipse(800, 550, 400, 400);

    noStroke();
    fill(128, 255, 0);
    ellipse(1100, 650, 400, 400);

    imageMode(CENTER);
    image(img, 950, 600);

    textSize(54);
    fill(255);

    //PLAY GAME
    if (selectedItem == 0)
    { 
      fill(0, 255, 0);
    }

    text("Play Game", 250, 525);
    fill(255);

    //OPTIONS
    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }


    text("Options", 250, 625);
    fill(255);

    //EXIT
    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }

    text("Exit", 250, 725);
    fill(255);
  }

  if (screenState==1)
  {
    gameSound.play();
    menuSound.pause();

    move();

    noStroke();
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);

    player1.initialize();
    player2.initialize();

    textSize(48);
    fill(255);
    text(secCounter, width - 100, 100); 

    float d = dist(player1.x, player1.y, player2.x, player2.y);

    if (d<50)
    {
      image(img, player1.x, player1.y);
      counting=false;

      player12stop();
    }

    if (counting==true) { 
      secCounter = (millis()-z)/1000;
    }
  } 

  if (screenState == 3)

  {
    gameSound.play();
    menuSound.pause();

    move();

    noStroke();
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);

    player3.r = 255;
    player3.g = 128;
    player3.b = 0;

    player4.r = 128;
    player4.g = 0;
    player4.b = 255;

    player1.initialize();
    player2.initialize();
    player3.initialize();
    player4.initialize();

    textSize(48);
    fill(255);
    text(secCounter, width - 100, 100);

    float d12 = dist(player1.x, player1.y, player2.x, player2.y);
    float d13 = dist(player1.x, player1.y, player3.x, player3.y);
    float d14 = dist(player1.x, player1.y, player4.x, player4.y);
    float d23 = dist(player2.x, player2.y, player3.x, player3.y);
    float d24 = dist(player2.x, player2.y, player4.x, player4.y);
    float d34 = dist(player3.x, player3.y, player4.x, player4.y);

    if (d12<50||d13<50||d14<50)
    {
      image(img, player1.x, player1.y);
      counting = false;
    }

    if (d23<50||d24<50)
    {
      image(img, player2.x, player2.y);
      counting = false;
    }    

    if (d34<50)
    {
      image(img, player3.x, player3.y);
      counting = false;
    } 

    if (counting==true) { 
      secCounter = (millis()-z)/1000;
    }
  }

  if (screenState == 2)
  {
    menuSound.play();
    gameSound.pause();

    background(0);
    counting = false;

    textAlign(CENTER);
    textSize(124);
    fill(255, 34, 0);
    text("Game Paused", width/2, 250);

    textSize(54);
    fill(255);

    //PLAY GAME
    if (selectedItem == 0)
    { 
      fill(0, 255, 0);
    }

    text("Back to Game", 750, 425);
    fill(255);

    //BACK TO GAME
    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }

    text("Main Menu", 750, 525);
    fill(255);

    //OPTIONS
    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }


    text("Options", 750, 625);
    fill(255);

    //EXIT
    if (selectedItem == 3)
    {
      fill(0, 255, 0);
    }

    text("Exit", 750, 725);
    fill(255);
  }

  if (screenState == 4)
  {
    menuSound.play();
    gameSound.pause();

    move();

    background(0);
    counting = false;

    textAlign(CENTER);
    textSize(124);
    fill(255, 34, 0);
    text("Game Paused", width/2, 250);

    textSize(54);
    fill(255);

    //PLAY GAME
    if (selectedItem == 0)
    { 
      fill(0, 255, 0);
    }

    text("Back to Game", 750, 425);
    fill(255);

    //BACK TO GAME
    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }

    text("Main Menu", 750, 525);
    fill(255);

    //OPTIONS
    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }


    text("Options", 750, 625);
    fill(255);

    //EXIT
    if (selectedItem == 3)
    {
      fill(0, 255, 0);
    }

    text("Exit", 750, 725);
    fill(255);
  }

  if (screenState == 5)
  {
    menuSound.play();
    gameSound.pause();

    move();

    background(0);
    counting = false;

    textAlign(CENTER);
    textSize(124);
    fill(255, 34, 0);
    text("Game Modes", width/2, 250);

    textSize(54);
    fill(255);

    //PLAY GAME
    if (selectedItem == 0)
    { 
      selectedItem = 1;
    }

    //BACK TO GAME
    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }

    text("Two Players", 750, 425);
    fill(255);

    //OPTIONS
    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }

    text("Four Players: Solo", 750, 525);
    fill(255);

    if (selectedItem == 3)
    {
      fill(0, 255, 0);
    }

    text("Four Players: Teams", 750, 625);
    fill(255);

    //EXIT
    if (selectedItem == 4)
    {
      fill(0, 255, 0);
    }

    text("Back", 750, 725);
    fill(255);
  }

  if (screenState == 6)
  {
    gameSound.play();
    menuSound.pause();

    move();

    noStroke();
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);

    player1.initialize();
    player2.initialize();
    player3.initialize();
    player4.initialize();

    player3.r = 0;
    player3.g = 128;
    player3.b = 255;

    player4.r = 128;
    player4.g = 255;
    player4.b = 0;

    textSize(48);
    fill(255);
    text(secCounter, width - 100, 100); 

    /* Teams:
     Players 1 and 3
     Players 2 and 4
     */

    float d12 = dist(player1.x, player1.y, player2.x, player2.y);
    float d14 = dist(player1.x, player1.y, player4.x, player4.y);
    float d23 = dist(player2.x, player2.y, player3.x, player3.y);
    float d34 = dist(player3.x, player3.y, player4.x, player4.y);

    if (d12<50)
    {
      image(img, player1.x, player1.y);
      player12stop();


      if (d34<50)
      {
        image(img, player3.x, player3.y);
        counting = false;
        player34stop();
      }
    } else if (d14<50)
    {
      image(img, player1.x, player1.y);
      player14stop();

      if (d23<50)
      {
        image(img, player3.x, player3.y);
        counting = false;
        player23stop();
      }
    } else if (d23<50)
    {
      image(img, player3.x, player3.y);
      player23stop();

      if (d14<50)
      {
        image(img, player1.x, player1.y);
        counting = false;
        player14stop();
      }
    } else if (d34<50)
    {
      image(img, player3.x, player3.y);
      player34stop();

      if (d12<50)
      {
        image(img, player1.x, player1.y);
        counting = false;
        player12stop();
      }
    }

    if (counting==true) 
    { 
      secCounter = ((millis()-z)/1000);
    }
  }

  if (screenState == 7)
  {
    menuSound.play();
    gameSound.pause();

    background(0);
    counting = false;

    textAlign(CENTER);
    textSize(124);
    fill(255, 34, 0);
    text("Game Paused", width/2, 250);

    textSize(54);
    fill(255);

    if (selectedItem == 0)
    { 
      fill(0, 255, 0);
    }

    text("Back to Game", 750, 425);
    fill(255);

    if (selectedItem == 1)
    {
      fill(0, 255, 0);
    }

    text("Main Menu", 750, 525);
    fill(255);

    if (selectedItem == 2)
    {
      fill(0, 255, 0);
    }


    text("Options", 750, 625);
    fill(255);

    if (selectedItem == 3)
    {
      fill(0, 255, 0);
    }

    text("Exit", 750, 725);
    fill(255);
  }
}


void keyPressed()
{
  if (key==ESC)
  {
    key = 0;

    if (screenState == 1)
    {
      screenState = 2;
    }

    if (screenState == 3)
    {
      screenState = 4;
    }

    if (screenState == 6)
    {
      screenState = 7;
    }
  }

  if (screenState == 0)
  {
    controls();

    listJump2();

    if (key==' ')
    {
      if (selectedItem == 0)
      {
        screenState = 5;
        secCounter = 0;
      }

      /*if(selectedItem == 1)
       {
       screenState = 8; 
       }*/

      if (selectedItem==2)
      {
        exit();
      }
    }
  }
  if (screenState == 2)
  {
    controls();

    listJump3();

    if (key==' ')
    {
      if (selectedItem==0)
      {
        screenState = 1;
        counting = true;
      }

      if (selectedItem==1)
      {
        screenState = 0;
        z = millis();
        counting = false;
      }

      if (selectedItem==3)
      {
        exit();
      }
    }
  }

  if (screenState == 4)
  {
    controls();

    listJump3();

    if (key==' ')
    {
      if (selectedItem==0)
      {
        screenState = 3;
        counting = true;
      }

      if (selectedItem==1)
      {
        screenState = 0;
        z = millis();
        counting = false;
      }

      if (selectedItem==3)
      {
        exit();
      }
    }
  }

  if (screenState == 5)
  {
    controls();

    listJump4();

    if (key==' ')
    {
      if (selectedItem==0)
      {
        screenState = 5;
      }

      if (selectedItem==1)
      {
        screenState = 1;
        z = millis();
        counting = true;

        player1.x = 100;
        player1.y = 100;

        player2.x = 1300;
        player2.y = 800;
      }

      if (selectedItem==2)
      {
        screenState = 3;
        z = millis();
        counting = true;

        player1.x = 100;
        player1.y = 100;

        player2.x = 1300;
        player2.y = 800;

        player3.x = 100;
        player3.y = 800;

        player4.x = 1300;
        player4.y = 100;
      }

      if (selectedItem==3)
      {
        screenState = 6;
        z = millis();
        counting = true;

        player1.x = 100;
        player1.y = 100;

        player2.x = 1300;
        player2.y = 800;

        player3.x = 1300;
        player3.y = 100;

        player4.x = 100;
        player4.y = 800;
      }

      if (selectedItem==4)
      {
        screenState = 0;
      }
    }
  }

  if (screenState == 7)
  {
    controls();

    listJump3();

    if (key==' ')
    {
      if (selectedItem==0)
      {
        screenState = 6;
        counting = true;
      }

      if (selectedItem==1)
      {
        screenState = 0;
        z = millis();
        counting = false;
      }

      if (selectedItem==3)
      {
        exit();
      }
    }
  }

  if (screenState == 1||screenState == 3||screenState == 6)
  {
    if (key=='w')
    {
      upPressed1 = true;
    }
    if (key=='s')
    {
      downPressed1 = true;
    }

    if (key=='a')
    {
      leftPressed1 = true;
    }

    if (key=='d')
    {
      rightPressed1 = true;
    }


    if (key==CODED)
    {

      if (keyCode==UP)
      {
        upPressed2=true;
      }

      if (keyCode==DOWN)
      {
        downPressed2=true;
      }

      if (keyCode==RIGHT)
      {
        rightPressed2=true;
      }

      if (keyCode==LEFT)
      {
        leftPressed2=true;
      }
    }

    if (key=='t')
    {
      upPressed3 = true;
    }

    if (key=='f')
    {
      leftPressed3 = true;
    }

    if (key=='g')
    {
      downPressed3 = true;
    }

    if (key=='h')
    {
      rightPressed3 = true;
    }

    if (key=='i')
    {
      upPressed4 = true;
    }

    if (key=='j')
    {
      leftPressed4 = true;
    }

    if (key=='k')
    {
      downPressed4 = true;
    }

    if (key=='l')
    {
      rightPressed4 = true;
    }

    if (key=='r')
    {

      player1.x = 100;
      player1.y = 100;
      player2.x = 1300;
      player2.y = 800;
      player3.x = 1300;
      player3.y = 100;
      player4.x = 100;
      player4.y = 800;

      player1.velX = 0;
      player1.velY = 0;
      player2.velX = 0;
      player2.velY = 0;
      player3.velX = 0;
      player3.velY = 0;
      player4.velX = 0;
      player4.velY = 0;

      secCounter = 0;
      z = millis();
      counting = true;
    }
  }
}

void controls()
{
  if (key=='w')
  {
    selectedItem-=1;
  }

  if (key=='s')
  {
    selectedItem+=1;
  }

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      selectedItem-=1;
    }

    if (keyCode == DOWN)
    {
      selectedItem+=1;
    }
  }
}

void listJump2()
{
  if (selectedItem>2)
  {
    selectedItem=0;
  }

  if (selectedItem<0)
  {
    selectedItem=2;
  }
}

void listJump3()
{
  if (selectedItem>3)
  {
    selectedItem=0;
  }

  if (selectedItem<0)
  {
    selectedItem=3;
  }
}

void listJump4()
{
  if (selectedItem>4)
  {
    selectedItem=0;
  }

  if (selectedItem<0)
  {
    selectedItem=4;
  }
}

void move()
{
  if (upPressed1)
  {
    player1.up();
  }

  if (downPressed1)
  {
    player1.down();
  }

  if (leftPressed1)
  {
    player1.left();
  }

  if (rightPressed1)
  {
    player1.right();
  }

  if (upPressed2)
  {
    player2.up();
  }

  if (downPressed2)
  {
    player2.down();
  }

  if (leftPressed2)
  {
    player2.left();
  }

  if (rightPressed2)
  {
    player2.right();
  }

  if (upPressed3)
  {
    player3.up();
  }

  if (downPressed3)
  {
    player3.down();
  }

  if (leftPressed3)
  {
    player3.left();
  }

  if (rightPressed3)
  {
    player3.right();
  }


  if (upPressed4)
  {
    player4.up();
  }

  if (downPressed4)
  {
    player4.down();
  }

  if (leftPressed4)
  {
    player4.left();
  }

  if (rightPressed4)
  {
    player4.right();
  }
}

void player12stop()
{
  player1.velX = 0;
  player1.velY = 0;

  player2.velX = 0;
  player2.velY = 0;

  if (keyPressed)
  {
    player1.velX += 0;
    player1.velY += 0;

    player2.velX += 0;
    player2.velY += 0;
  }

  player1.x = player2.x;
  player1.y = player2.y;
}

void player14stop()
{
  player1.velX = 0;
  player1.velY = 0;

  player4.velX = 0;
  player4.velY = 0;

  if (keyPressed)
  {
    player1.velX += 0;
    player1.velY += 0;

    player4.velX += 0;
    player4.velY += 0;
  }

  player1.x = player4.x;
  player1.y = player4.y;
}

void player23stop()
{
  player2.velX = 0;
  player2.velY = 0;

  player3.velX = 0;
  player3.velY = 0;

  if (keyPressed)
  {
    player2.velX += 0;
    player2.velY += 0;

    player3.velX += 0;
    player3.velY += 0;
  }

  player2.x = player3.x;
  player2.y = player3.y;
}

void player34stop()
{
  player3.velX = 0;
  player3.velY = 0;

  player4.velX = 0;
  player4.velY = 0;

  if (keyPressed)
  {
    player3.velX += 0;
    player3.velY += 0;

    player4.velX += 0;
    player4.velY += 0;
  }

  player3.x = player4.x;
  player3.y = player4.y;
}