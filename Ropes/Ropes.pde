ArrayList<Rope> r = new ArrayList<Rope>();
int ropeLim = 1;

void setup()
{
  fullScreen(P2D);
  background(0);

  for (int i = 0; i < ropeLim; i++)
  {
    float y = (height/ropeLim) * i + (height/ropeLim)/2;
    r.add(new Rope(y));
  }
}

void draw()
{
  for(int i = 0; i < r.size(); i++)
  {
    if(r.get(i).getX() <= width)
    {
    r.get(i).update();
    }
  }
}