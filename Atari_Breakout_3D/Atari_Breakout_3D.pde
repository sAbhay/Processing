
import damkjer.ocd.*;

boolean upPressed, downPressed, leftPressed, rightPressed, depthUp, depthDown;

Camera cam;

float range = 5000;

PVector paddle;
float paddleSize = 50;

ArrayList<Ball> b = new ArrayList<Ball>(); 

PVector target = new PVector(width/2, height/2, -range);

void setup()
{
  fullScreen(P3D);
  noStroke();
  rectMode(CENTER);

  cam = new Camera(this, width/2, height/2, 0, width/2, height/2, -range);  
}

void draw()
{
  paddle = new PVector(mouseX, mouseY, 0);
  
  if(b.size() < 1)
  {
    b.add(new Ball(paddle, target));
  }
  
  background(0);

  cam.feed();
  //mouseLook();
  camMove();
  
  pushMatrix();
  translate(width/2, height/2, -range/2);
  noFill();
  stroke(255);
  box(width, height, range);
  popMatrix();
  
  for(int i = 0; i < b.size(); i++)  
  {
    b.get(i).update();
    
    if(b.get(i).pos.x >= paddle.x - paddleSize/2 && b.get(i).pos.x <= paddle.x + paddleSize/2 && b.get(i).pos.y >= paddle.y - paddleSize/2 && b.get(i).pos.y >= paddle.y - paddleSize/2)
    {
     b.get(i).bounce(); 
    }
  }
}

void mouseLook()
{
  cam.pan(radians((mouseX - pmouseX)/2));
  cam.tilt(radians((mouseY - pmouseY)/2));
}

void camMove()
{
  cam.truck(mouseX - pmouseX);
  cam.boom(mouseY - pmouseY);
}