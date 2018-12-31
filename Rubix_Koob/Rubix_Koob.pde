import queasycam.*;

float cubeSize = 300;
PVector pos;

QueasyCam cam;

//Piece[] p = new Piece[27];
ArrayList<Piece> p = new ArrayList<Piece>();

void setup()
{
  fullScreen(P3D);

  pos = new PVector(0, 0, 0);

  cam = new QueasyCam(this);

  for (int x = 0; x < 3; x++)
  {
    for (int y = 0; y < 3; y++)
    {
      for (int z = 0; z < 3; z++)
      {
        p.add(new Piece(x, y, z));
      }
    }
  }
}

void draw()
{
  background(0);
  //cam.position.y = 0;

  for (int i = 0; i < p.size(); i++)
  {
    p.get(i).display();
  }
}

void mousePressed()
{
  for(int i = 0; i < 9; i++)
  {
   int[] n = p.get(i).getIndex();
   
   p.get(i).setIndexX(n[1]);
   p.get(i).setIndexY(n[0]);
  }
}