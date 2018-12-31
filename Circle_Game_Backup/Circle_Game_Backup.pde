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

boolean upPressed;
boolean downPressed;
boolean rightPressed;
boolean leftPressed;
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

float x=100;
float y=100;
float x1=1300;
float y1=800;
float x2 = 100;
float y2 = 800;
float x3 = 1300;
float y3 = 100;

boolean counting=false;
int secCounter;
int z;

int screenState = 0;
int selectedItem = 0;

void setup()
{
  smooth();
  fullScreen(P2D);
  
  noCursor();

  img = loadImage("explosion.png");
  logoFont = createFont("youregone-italic.ttf", 144);

  menu = new Minim(this);
  menuSound = menu.loadFile("Stronger Monsters.mp3");

  game = new Minim(this);
  gameSound = game.loadFile("Megalovania.mp3");

  menuSound.loop();
  gameSound.loop();
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

  if (key==CODED)
  {

    if (keyCode==UP)
    {
      upPressed1=false;
    }

    if (keyCode==DOWN)
    {
      downPressed1=false;
    }

    if (keyCode==RIGHT)
    {
      rightPressed1=false;
    }

    if (keyCode==LEFT)
    {
      leftPressed1=false;
    }
  }

  if (key=='t')
  {
    upPressed2 = false;
  }

  if (key=='f')
  {
    leftPressed2 = false;
  }

  if (key=='g')
  {
    downPressed2 = false;
  }

  if (key=='h')
  {
    rightPressed2 = false;
  }

  if (key=='i')
  {
    upPressed3 = false;
  }

  if (key=='j')
  {
    leftPressed3 = false;
  }

  if (key=='k')
  {
    downPressed3 = false;
  }

  if (key=='l')
  {
    rightPressed3 = false;
  }
}

void draw()
{ 
  imageMode(CENTER);
  img.resize(400, 425);

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
    text("Circle Game", width/2, 250);

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

    noStroke();
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);

    fill(0, 128, 255);
    ellipse(x, y, 50, 50);
    fill(128, 255, 0);
    ellipse(x1, y1, 50, 50);

    textSize(48);
    fill(255);
    text(secCounter/1000, width - 100, 100); 

    if (keyPressed)

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

      if (key==CODED)
      {

        if (keyCode==UP)
        {
          upPressed1=true;
        }

        if (keyCode==DOWN)
        {
          downPressed1=true;
        }

        if (keyCode==RIGHT)
        {
          rightPressed1=true;
        }

        if (keyCode==LEFT)
        {
          leftPressed1=true;
        }
      }

      if (key=='r')
      {
        x=100;
        y=100;
        x1=1300;
        y1=800;

        secCounter = 0;
        z = millis();
        counting = true;
      }

      if (key=='p')
      {
        screenState = 2;
      }
    }

    if (upPressed==true)
    {
      y-=10;
    }

    if (downPressed==true)
    {
      y+=10;
    }

    if (leftPressed==true)
    {
      x-=10;
    }

    if (rightPressed==true)
    {
      x+=10;
    }

    if (upPressed1==true)
    {
      y1-=10;
    }

    if (downPressed1==true)
    {
      y1+=10;
    }

    if (leftPressed1==true)
    {
      x1-=10;
    }

    if (rightPressed1==true)
    {
      x1+=10;
    }

    float d = dist(x, y, x1, y1);

    if (d<50)
    {
      image(img, x, y);
      counting=false;
    }

    if (counting==true) { 
      secCounter = millis()-z;
    }

    if (y<0)
    {
      y = 0;
    }

    if (y>height)
    {
      y = height;
    }

    if (x<0)
    {
      x = 0;
    }

    if (x>width)
    {
      x = width;
    }

    if (y1<0)
    {
      y1 = 0;
    }

    if (y1>height)
    {
      y1 = height;
    }

    if (x1<0)
    {
      x1 = 0;
    }

    if (x1>width)
    {
      x1 = width;
    }
  } 

  if (screenState == 3)

  {
    gameSound.play();
    menuSound.pause();

    noStroke();
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);

    fill(0, 128, 255);
    ellipse(x, y, 50, 50);
    fill(128, 255, 0);
    ellipse(x1, y1, 50, 50);
    fill(255, 128, 0);
    ellipse(x2, y2, 50, 50);
    fill(128, 0, 255);
    ellipse(x3, y3, 50, 50);

    textSize(48);
    fill(255);
    text(secCounter/1000, width - 100, 100); 

    if (keyPressed)    
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


      if (key==CODED)
      {

        if (keyCode==UP)
        {
          upPressed1=true;
        }

        if (keyCode==DOWN)
        {
          downPressed1=true;
        }

        if (keyCode==RIGHT)
        {
          rightPressed1=true;
        }

        if (keyCode==LEFT)
        {
          leftPressed1=true;
        }
      }

      if (key=='t')
      {
        upPressed2 = true;
      }

      if (key=='f')
      {
        leftPressed2 = true;
      }

      if (key=='g')
      {
        downPressed2 = true;
      }

      if (key=='h')
      {
        rightPressed2 = true;
      }

      if (key=='i')
      {
        upPressed3 = true;
      }

      if (key=='j')
      {
        leftPressed3 = true;
      }

      if (key=='k')
      {
        downPressed3 = true;
      }

      if (key=='l')
      {
        rightPressed3 = true;
      }

      if (key=='r')
      {

        x=100;
        y=100;
        x1=1300;
        y1=800;
        x2 = 100;
        y2 = 800;
        x3 = 1300;
        y3 = 100;

        secCounter = 0;
        z = millis();
        counting = true;
      }

      if (key=='p')
      {
        screenState = 4;
      }
    }

    if (upPressed==true)
    {
      y-=10;
    }

    if (downPressed==true)
    {
      y+=10;
    }

    if (leftPressed==true)
    {
      x-=10;
    }

    if (rightPressed==true)
    {
      x+=10;
    }

    if (upPressed1==true)
    {
      y1-=10;
    }

    if (downPressed1==true)
    {
      y1+=10;
    }

    if (leftPressed1==true)
    {
      x1-=10;
    }

    if (rightPressed1==true)
    {
      x1+=10;
    }

    if (upPressed2==true)
    {
      y2-=10;
    }

    if (downPressed2==true)
    {
      y2+=10;
    }

    if (leftPressed2==true)
    {
      x2-=10;
    }

    if (rightPressed2==true)
    {
      x2+=10;
    }


    if (upPressed3==true)
    {
      y3-=10;
    }

    if (downPressed3==true)
    {
      y3+=10;
    }

    if (leftPressed3==true)
    {
      x3-=10;
    }

    if (rightPressed3==true)
    {
      x3+=10;
    }

    float d12 = dist(x, y, x1, y1);
    float d13 = dist(x, y, x2, y2);
    float d14 = dist(x, y, x3, y3);
    float d23 = dist(x1, y1, x2, y2);
    float d24 = dist(x1, y1, x3, y3);
    float d34 = dist(x2, y2, x3, y3);

    if (d12<50||d13<50||d14<50)
    {
      image(img, x, y);
      counting=false;
    }

    if (d23<50||d24<50)
    {
      image(img, x1, y1);
      counting = false;
    }    

    if (d34<50)
    {
      image(img, x2, y2);
      counting = false;
    } 

    if (counting==true) { 
      secCounter+= ((millis()-z)*0.025);
    }

    if (y<0)
    {
      y = 0;
    }

    if (y>height)
    {
      y = height;
    }

    if (x<0)
    {
      x = 0;
    }

    if (x>width)
    {
      x = width;
    }

    if (y1<0)
    {
      y1 = 0;
    }

    if (y1>height)
    {
      y1 = height;
    }

    if (x1<0)
    {
      x1 = 0;
    }

    if (x1>width)
    {
      x1 = width;
    }

    if (y2<0)
    {
      y2 = 0;
    }

    if (y2>height)
    {
      y2 = height;
    }

    if (x2<0)
    {
      x2 = 0;
    }

    if (x2>width)
    {
      x2 = width;
    }

    if (y3<0)
    {
      y3 = 0;
    }

    if (y3>height)
    {
      y3 = height;
    }

    if (x3<0)
    {
      x3 = 0;
    }

    if (x3>width)
    {
      x3 = width;
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

    noStroke();
    fill(0, 0, 0, 75);
    rect(0, 0, width, height);

    fill(0, 128, 255);
    ellipse(x, y, 50, 50);
    fill(128, 255, 0);
    ellipse(x1, y1, 50, 50);
    fill(0, 128, 255);
    ellipse(x2, y2, 50, 50);
    fill(128, 255, 0);
    ellipse(x3, y3, 50, 50);

    textSize(48);
    fill(255);
    text(secCounter/1000, width - 100, 100); 

    if (keyPressed)    
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


      if (key==CODED)
      {

        if (keyCode==UP)
        {
          upPressed1=true;
        }

        if (keyCode==DOWN)
        {
          downPressed1=true;
        }

        if (keyCode==RIGHT)
        {
          rightPressed1=true;
        }

        if (keyCode==LEFT)
        {
          leftPressed1=true;
        }
      }

      if (key=='t')
      {
        upPressed2 = true;
      }

      if (key=='f')
      {
        leftPressed2 = true;
      }

      if (key=='g')
      {
        downPressed2 = true;
      }

      if (key=='h')
      {
        rightPressed2 = true;
      }

      if (key=='i')
      {
        upPressed3 = true;
      }

      if (key=='j')
      {
        leftPressed3 = true;
      }

      if (key=='k')
      {
        downPressed3 = true;
      }

      if (key=='l')
      {
        rightPressed3 = true;
      }

      if (key=='r')
      {

        x = 100;
        y = 100;
        x1 = 1300;
        y1 = 800;
        x2 = 1300;
        y2 = 100;
        x3 = 100;
        y3 = 800;

        secCounter = 0;
        z = millis();
        counting = true;
      }

      if (key=='p')
      {
        screenState = 7;
      }
    }

    if (upPressed==true)
    {
      y-=10;
    }

    if (downPressed==true)
    {
      y+=10;
    }

    if (leftPressed==true)
    {
      x-=10;
    }

    if (rightPressed==true)
    {
      x+=10;
    }

    if (upPressed1==true)
    {
      y1-=10;
    }

    if (downPressed1==true)
    {
      y1+=10;
    }

    if (leftPressed1==true)
    {
      x1-=10;
    }

    if (rightPressed1==true)
    {
      x1+=10;
    }

    if (upPressed2==true)
    {
      y2-=10;
    }

    if (downPressed2==true)
    {
      y2+=10;
    }

    if (leftPressed2==true)
    {
      x2-=10;
    }

    if (rightPressed2==true)
    {
      x2+=10;
    }


    if (upPressed3==true)
    {
      y3-=10;
    }

    if (downPressed3==true)
    {
      y3+=10;
    }

    if (leftPressed3==true)
    {
      x3-=10;
    }

    if (rightPressed3==true)
    {
      x3+=10;
    }

    /* Teams:
     x,y and x2,y2
     x1,y1 and x3,y3
     */

    float d12 = dist(x, y, x1, y1);
    float d14 = dist(x, y, x3, y3);
    float d23 = dist(x1, y1, x2, y2);
    float d34 = dist(x2, y2, x3, y3);

    if (d12<50)
    {
      image(img, x, y);

      if (d34<50)
      {
        image(img, x2, y2);
        counting = false;
      }
    }

    if (d14<50)
    {
      image(img, x, y);

      if (d23<50)
      {
        image(img, x2, y2);
        counting = false;
      }
    }

    if (d23<50)
    {
      image(img, x2, y2);

      if (d14<50)
      {
        image(img, x, y);
        counting = false;
      }
    }

    if (d34<50)
    {
      image(img, x2, y2);

      if (d12<50)
      {
        image(img, x, y);
        counting = false;
      }
    }

    if (counting==true) { 
      secCounter+= ((millis()-z)*0.025);
    }

    if (y<0)
    {
      y = 0;
    }

    if (y>height)
    {
      y = height;
    }

    if (x<0)
    {
      x = 0;
    }

    if (x>width)
    {
      x = width;
    }

    if (y1<0)
    {
      y1 = 0;
    }

    if (y1>height)
    {
      y1 = height;
    }

    if (x1<0)
    {
      x1 = 0;
    }

    if (x1>width)
    {
      x1 = width;
    }

    if (y2<0)
    {
      y2 = 0;
    }

    if (y2>height)
    {
      y2 = height;
    }

    if (x2<0)
    {
      x2 = 0;
    }

    if (x2>width)
    {
      x2 = width;
    }

    if (y3<0)
    {
      y3 = 0;
    }

    if (y3>height)
    {
      y3 = height;
    }

    if (x3<0)
    {
      x3 = 0;
    }

    if (x3>width)
    {
      x3 = width;
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

}


void keyPressed()
{
  if (key==ESC)
  {
    key = 0;
  }

  if (screenState == 0)
  {
    if (key=='w')
    {
      selectedItem-=1;
    }

    if (key=='s')
    {
      selectedItem+=1;
    }

    if (selectedItem>2)
    {
      selectedItem=0;
    }

    if (selectedItem<0)
    {
      selectedItem=2;
    }

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
    if (key=='w')
    {
      selectedItem-=1;
    }

    if (key=='s')
    {
      selectedItem+=1;
    }

    if (selectedItem>3)
    {
      selectedItem=0;
    }

    if (selectedItem<0)
    {
      selectedItem=3;
    }

    if (key==' ')
    {
      if (selectedItem==0)
      {
        screenState = 1;
        z = millis() + 25;
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
    if (key=='w')
    {
      selectedItem-=1;
    }

    if (key=='s')
    {
      selectedItem+=1;
    }

    if (selectedItem>3)
    {
      selectedItem=0;
    }

    if (selectedItem<0)
    {
      selectedItem=3;
    }

    if (key==' ')
    {
      if (selectedItem==0)
      {
        screenState = 3;
        z = millis() + 25;
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
    if (key=='w')
    {
      selectedItem-=1;
    }

    if (key=='s')
    {
      selectedItem+=1;
    }

    if (selectedItem>4)
    {
      selectedItem=0;
    }

    if (selectedItem<0)
    {
      selectedItem=4;
    }

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

        x = 100;
        y = 100;

        x1 = 1300;
        y1 = 800;
      }

      if (selectedItem==2)
      {
        screenState = 3;
        z = millis();
        counting = true;

        x = 100;
        y = 100;

        x1 = 1300;
        y1 = 800;

        x2 = 100;
        y2 = 800;

        x3 = 1300;
        y3 = 100;
      }

      if (selectedItem==3)
      {
        screenState = 6;
        z = millis();
        counting = true;

        x = 100;
        y = 100;

        x1 = 1300;
        y1 = 800;

        x2 = 1300;
        y2 = 100;

        x3 = 100;
        y3 = 800;
      }

      if (selectedItem==4)
      {
        screenState = 0;
      }
    }
  }
  
  if (screenState == 7)
  {
    if (key=='w')
    {
      selectedItem-=1;
    }

    if (key=='s')
    {
      selectedItem+=1;
    }

    if (selectedItem>3)
    {
      selectedItem=0;
    }

    if (selectedItem<0)
    {
      selectedItem=3;
    }

    if (key==' ')
    {
      if (selectedItem==0)
      {
        screenState = 6;
        z = millis() + 25;
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
}