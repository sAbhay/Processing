class Rope
{
  private ArrayList<PVector> pos = new ArrayList<PVector>();
  private float x;
  private float y;
  private float rot;
  private float change;

  Rope(float _y)
  {
    y  = _y;
    x = 0;
    rot = 0;
    change = 0.5;
    pos.add(new PVector(cos(rot) + x, sin(rot)));
  }

  private void move()
  {
    x += change;
    rot += change;

    pos.add(new PVector(20*cos(rot) + x, 20*sin(rot) + y));
  }
  
  private void display()
  {
   for(int i = 0; i < pos.size(); i++)
   {
    fill(255);
    //noStroke();
    ellipse(pos.get(i).x, pos.get(i).y, 10, 10);
   }
  }
  
  public void update()
  {
   move();
   display();
  }
  
  public float getX()
  {
    return x;
  }
}