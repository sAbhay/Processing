class Terrain
{
  PImage map;

  float w;
  float h;

  int blocksX;
  int blocksZ;

  int detail;

  PVector points[][];

  PShape t;

  Terrain(PImage m, int d)
  {
    map = m;
    detail = d;

    //map.resize(200, 200);

    w = map.width;
    h = map.height;

    blocksX = (int) w/detail;
    blocksZ = (int) h/detail;

    points = new PVector[blocksX][blocksZ];
  }

  void create()
  {
    for (int x = 0; x < blocksX; x++)
    {
      for (int y = 0; y < blocksZ; y++)
      {
        color pixel = map.get(x*detail, y*detail);
        float h = brightness(pixel);

        points[x][y] = new PVector(x*20, h*20, y*20);
      }
    }

    t = new PShape(TRIANGLE_STRIP);

    t.beginShape();

    for (int i = 0; i < blocksX-1; i++)
    {
      for (int j = 0; j < blocksZ-1; j++)
      {
        t.vertex(points[i][j].x, points[i][j].y, points[i][j].z);
        t.vertex(points[i+1][j].x, points[i+1][j].y, points[i+1][j].z);
        t.vertex(points[i][j+1].x, points[i][j+1].y, points[i][j+1].z);
        t.vertex(points[i+1][j+1].x, points[i+1][j+1].y, points[i+1][j+1].z);
      }
    }

    t.endShape();
  }

  void display()
  {
    //beginShape(TRIANGLE_STRIP);

    //for (int i = 0; i < blocksX-1; i++)
    //{
    //  for (int j = 0; j < blocksZ-1; j++)
    //  {
    //    t.vertex(points[i][j].x, points[i][j].y, points[i][j].z);
    //    t.vertex(points[i+1][j].x, points[i+1][j].y, points[i+1][j].z);
    //    t.vertex(points[i][j+1].x, points[i][j+1].y, points[i][j+1].z);
    //    //t.vertex(points[i+1][j+1].x, points[i+1][j+1].y, points[i+1][j+1].z);
    //  }
    //}

    //fill(255, 0, 0);

    //endShape(CLOSE);

    shape(t);
  }
}