float input[] = {0, 0, 0};
boolean turn[] = {false, false};
String gameInput = "lrl";
PVector pos;
PVector size = new PVector(59.5*2, 82*2);
PVector switchPos;
PVector switchSize = new PVector(800, 200);
PVector vel = new PVector(0, 0);
float rot = 0;

void setup()
{
  fullScreen(P2D);
  strokeWeight(2);
  rectMode(CENTER);

  println(width + " " + height);

  pos = new PVector(width/2, 0.90*height);
  switchPos = new PVector(width/2, 0.10*height);
}

void draw()
{
  //background(0);
  fill(255);
  rect(width/2, height/2, width, height);

  input[0] = -(switchPos.y + switchSize.y/2) + (pos.y - size.y/2);
  input[1] = -(switchPos.y + switchSize.y/2) + (pos.y - size.x/2);
  //input[2] = pos.y + size.x/2;

  pos = pos.add(vel);

  pushMatrix();
  translate(pos.x, pos.y);
  rotate(degrees(rot));
  rect(0, 0, size.x, size.y);
  popMatrix();
  
  rect(switchPos.x, switchPos.y, switchSize.x, switchSize.y);

  if (!turn[0])
  {
    if (input[0] <= 20)
    {
      turn[0] = true;
      vel.y = 0;
    }
    else
    {
      vel.y = -2;
    }
  }
  
  if(turn[0] && !turn[1])
  {
    if(input[0] >= 19)
    {
      rot+=0.001;
    }
  }
}