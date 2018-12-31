import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

boolean upPressed1;
boolean downPressed1;
boolean rightPressed1;
boolean leftPressed1;
boolean depthUp1;
boolean depthDown1;

boolean upPressed2;
boolean downPressed2;
boolean rightPressed2;
boolean leftPressed2;
boolean depthUp2;
boolean depthDown2;

PeasyCam cam;

Player player1;
Player player2;

boolean counting = true;
int secCounter = 0;
int z;

int screenState;
int selectedItem;

ArrayList<particle> p = new ArrayList<particle>();

PShape explosion;
PImage texture;

void setup()
{
  fullScreen(P3D);

  cam = new PeasyCam(this, 0, 0, 0, 100);
  cam.setMaximumDistance(300);
  cam.setMinimumDistance(300);

  player1 = new Player();
  player2 = new Player();
}

void draw()
{
  background(0);

  pushMatrix();
  player1.r = 128;
  player1.g = 255;
  player1.b = 0;

  player1.initialize();
  popMatrix();

  pushMatrix();
  player2.r = 0;
  player2.g = 128;
  player2.b = 255;

  player2.initialize();
  popMatrix();

  if (counting) 
  { 
    secCounter = (millis()-z)/1000;
  }

  fill(255);
  textSize(15);
  text(secCounter, 250, -145);

  move();

  float d = dist(player1.x, player1.y, player1.z, player2.x, player2.y, player2.z);

  if (d < 2 * player1.sphereSize)
  {
    pushMatrix();

    translate(player1.x, player1.y, player1.z);
    fill(255, 64, 0);
    stroke(255, 128, 0);
    sphere(player1.sphereSize*2);

    popMatrix();

    for (int i = 0; i < 10; i++)
    {
      p.add(new particle(random(1, 5), random(-5, 5), random(-5, 5)));
    }

    player12stop();

    counting = false;
  } else {
    counting = true;
  }

  stroke(255);
  strokeWeight(1);
  line(-200, -110, -260, -110);
  fill(255);
  textSize(10);
  //text("z", -197.5, -106);
  text("0", -270, -106);

  pushMatrix();
  translate(-245, -player1.z/4 - 110, 0);
  fill(player1.g, player1.b, player1.r);
  sphereDetail(30);
  sphere(player1.radius/5);
  stroke(player1.r, player1.g, player1.b);
  fill(255, 0);
  sphereDetail(8);
  sphere(player1.sphereSize/5);
  popMatrix();

  pushMatrix();
  stroke(255);
  strokeWeight(1);
  translate(-215, -player2.z/4 - 110, 0);
  sphereDetail(30);
  fill(player2.g, player2.b, player2.r);
  sphere(player2.radius/5);
  fill(255, 0);
  stroke(player2.r, player2.g, player2.b);
  sphereDetail(8);
  sphere(player2.sphereSize/5);
  popMatrix();

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

    if (j > 300)
    {
      j = 300;

      p.get(j).kill = true;

      if (p.get(j).kill)
      {
        p.remove(j);
      }
    }
  }
}

void keyPressed()
{
  if (key == 'w')
  {
    upPressed1 = true;
  }

  if (key == 's')
  {
    downPressed1 = true;
  }

  if (key == 'a')
  {
    leftPressed1 = true;
  }

  if (key == 'd')
  {
    rightPressed1 = true;
  }

  if (key == 'q')
  {
    depthDown1 = true;
  }

  if (key == 'e')
  {
    depthUp1 = true;
  }

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      upPressed2 = true;
    }

    if (keyCode == DOWN)
    {
      downPressed2 = true;
    }

    if (keyCode == LEFT)
    {
      leftPressed2 = true;
    }

    if (keyCode == RIGHT)
    {
      rightPressed2 = true;
    }

    if (keyCode == ALT)
    {
      depthDown2 = true;
    }

    if (keyCode == SHIFT)
    {
      depthUp2 = true;
    }
  }

  if (key == 'n')
  {
    depthDown2 = true;
  }

  if (key == 'm')
  {
    depthUp2 = true;
  }

  if (key == 'r')
  {
    player1.x = -200;
    player1.y = -125;
    player1.z = 0;

    player2.x = 200;
    player2.y = 125;
    player2.z = 0;

    player1.velX = 0;
    player1.velY = 0;
    player1.velZ = 0;

    player2.velX = 0;
    player2.velY = 0;
    player2.velZ = 0;

    z = millis();
  }
}

void keyReleased()
{
  if (key == 'w')
  {
    upPressed1 = false;
  }

  if (key == 's')
  {
    downPressed1 = false;
  }

  if (key == 'a')
  {
    leftPressed1 = false;
  }

  if (key == 'd')
  {
    rightPressed1 = false;
  }

  if (key == 'q')
  {
    depthDown1 = false;
  }

  if (key == 'e')
  {
    depthUp1 = false;
  }

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      upPressed2 = false;
    }

    if (keyCode == DOWN)
    {
      downPressed2 = false;
    }

    if (keyCode == LEFT)
    {
      leftPressed2 = false;
    }

    if (keyCode == RIGHT)
    {
      rightPressed2 = false;
    }

    if (keyCode == ALT)
    {
      depthDown2 = false;
    }

    if (keyCode == SHIFT)
    {
      depthUp2 = false;
    }
  }

  if (key == 'n')
  {
    depthDown2 = false;
  }

  if (key == 'm')
  {
    depthUp2 = false;
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

  if (depthUp1)
  {
    player1.increaseDepth();
  }

  if (depthDown1)
  {
    player1.decreaseDepth();
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

  if (depthUp2)
  {
    player2.increaseDepth();
  }

  if (depthDown2)
  {
    player2.decreaseDepth();
  }
}

void player12stop()
{
  player1.velX = 0;
  player1.velY = 0;
  player1.velZ = 0;

  player2.velX = 0;
  player2.velY = 0;
  player2.velZ = 0;

  if (keyPressed)
  {
    player1.velX += 0;
    player1.velY += 0;
    player1.velZ += 0;

    player2.velX += 0;
    player2.velY += 0;
    player2.velZ += 0;
  }

  player1.x = player2.x;
  player1.y = player2.y;
  player1.z = player2.z;
}