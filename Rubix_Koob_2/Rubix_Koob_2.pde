import queasycam.*;

QueasyCam cam;

ArrayList<Piece> p = new ArrayList<Piece>();
int cubeSize = 300;

PVector target;

boolean rotating = false;
float rot = 0;

void setup()
{
  fullScreen(P3D);

  cam = new QueasyCam(this);

  for (int x = 0; x < 3; x++)
  {
    for (int y = 0; y < 3; y++)
    {
      for (int z = 0; z < 3; z++)
      {
        p.add(new Piece(x, y, z, cubeSize/3));
      }
    }
  }
  
  println("Center to corner piece: " + dist(p.get(0).pos.x, p.get(0).pos.y, p.get(0).pos.z, p.get(13).pos.x, p.get(13).pos.y, p.get(13).pos.z));
  println("Center to adjacent piece: " + dist(p.get(13).pos.x, p.get(13).pos.y, p.get(13).pos.z, p.get(10).pos.x, p.get(10).pos.y, p.get(10).pos.z));
  println("Center to non-corner non-adjacent piece: " + dist(p.get(13).pos.x, p.get(13).pos.y, p.get(13).pos.z, p.get(1).pos.x, p.get(1).pos.y, p.get(1).pos.z));
}

void draw()
{
  target = PVector.add(cam.position, cam.getForward());

  background(0);

  for (int i = 0; i < p.size(); i++)
  {
    p.get(i).display(i);

    //10 top 16 bottom 22 right 4 left 12 back 14 front
  }
}

void mousePressed()
{
  //for (int i = 0; i < p.size(); i++)
  // {
  //   //if (target.x <= p.get(10).pos.x - p.get(10).size/2 && target.x >= p.get(10).pos.x + p.get(10).size/2 && target.z <= p.get(10).pos.z - p.get(10).size/2 && target.z >= p.get(10).pos.z + p.get(10).size/2)
  //   {
  //     pushMatrix();

  //     translate(p.get(10).pos.x, p.get(10).pos.y, p.get(10).pos.z);
  //     rotateY(90);

  //     popMatrix();

  //     if(p.get(i).pos.y == p.get(10).pos.y)
  //     {
  //      p.get(i).pos.x += cos(rot) * cubeSize/2;
  //      p.get(i).pos.z += sin(rot) * cubeSize/2;
  //     }
  //   }

  //   //10 top 16 bottom 22 right 4 left 12 back 14 front
  // }

  for (int i = 0; i < p.size(); i++)
  {
    if (p.get(i).pos.y >= p.get(10).pos.y - p.get(10).size/2 && p.get(i).pos.y <= p.get(10).pos.y + p.get(10).size/2 && i != 10)
    {
      p.get(i).setPrev(p.get(i).pos);
      
      if (dist(p.get(10).pos.x, p.get(10).pos.z, p.get(i).pos.x, p.get(i).pos.z) <= cubeSize/3)
      { 
        p.get(i).pos.x += cos(radians(PI/2)) * 2*cubeSize/3;
        p.get(i).pos.z += cos(radians(PI/2)) * 2*cubeSize/3;
      } else
      {
        //p.get(i).pos.x += (sin(radians(PI/4)) * cubeSize);
        //p.get(i).pos.z += (cos(radians(PI/4)) * cubeSize);
      }
    }

    //10 top 16 bottom 22 right 4 left 12 back 14 front
  }
}