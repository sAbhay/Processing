class Piece
{
  PVector pos;
  PVector rot;

  int size;
  color c;

  char type; // c = corner, a = adjacent, n = none, C = center
  int s;

  Piece(int x, int y, int z, int _s)
  {
    s = _s;
    size = s/3;

    if (x == 0 && y == 0 && z == 0)
    {
     type = 'c';
    } else if (x == 1 && y == 0 && z == 0)
    {
      type = 'n';
    } else if (x == 2 && y == 0 && z == 0)
    {
      type = 'c';
    }

    // ________________________________________________

    else if (x == 0 && y == 1 && z == 0)
    {
      type = 'n';
    } else if (x == 1 && y == 1 && z == 0)
    {
      type = 'a';
    } else if (x == 2 && y == 1 && z == 0)
    {
      type = 'n';
    }

    // ________________________________________________

    else if (x == 0 && y == 2 && z == 0)
    {
      type = 'c';
    } else if (x == 1 && y == 2 && z == 0)
    {
      type = 'n';
    } else if (x == 2 && y == 2 && z == 0)
    {
      type = 'c';
    }

    // ________________________________________________
    // ________________________________________________

    else if (x == 0 && y == 0 && z == 1)
    {
      type = 'n';
    } else if (x == 1 && y == 0 && z == 1)
    {
      type = 'a';
    } else if (x == 2 && y == 0 && z == 1)
    {
      type = 'n';
    }

    // ________________________________________________

    else if (x == 0 && y == 1 && z == 1)
    {
      type = 'a';
    } else if (x == 1 && y == 1 && z == 1)
    {
      type = 'C';
    } else if (x == 2 && y == 1 && z == 1)
    {
      type = 'a';
    }

    // ________________________________________________

    else if (x == 0 && y == 2 && z == 1)
    {
      type = 'n';
    } else if (x == 1 && y == 2 && z == 1)
    {
      type = 'a';
    } else if (x == 2 && y == 2 && z == 1)
    {
      type = 'n';
    }

    // ________________________________________________
    // ________________________________________________

    else if (x == 0 && y == 0 && z == 2)
    {
      type = 'c';
    } else if (x == 1 && y == 0 && z == 2)
    {
      type = 'n';
    } else if (x == 2 && y == 0 && z == 2)
    {
      type = 'c';
    }

    // ________________________________________________

    else if (x == 0 && y == 1 && z == 2)
    {
      type = 'n';
    } else if (x == 1 && y == 1 && z == 2)
    {
      type = 'a';
    } else if (x == 2 && y == 1 && z == 2)
    {
      type = 'n';
    }

    // ________________________________________________

    else if (x == 0 && y == 2 && z == 2)
    {
      type = 'c';
    } else if (x == 1 && y == 2 && z == 2)
    {
      type = 'n';
    } else if (x == 2 && y == 2 && z == 2)
    {
      type = 'c';
    }
  }

  void display()
  {
    pushMatrix();
    
    translate(s/2, s/2, s/2);
    
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.z);
    
    pushMatrix();
    
    translate(pos.x, pos.y, pos.z);
    box(size);
    
    popMatrix();
    
    popMatrix();
  }
}