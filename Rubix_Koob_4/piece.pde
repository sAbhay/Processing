class Piece
{
  int[] i = new int[3];
  color[] colours = {color(255, 128, 0), color(255), color(0, 255, 0), color(0, 0, 255), color(255, 0, 0), color(255, 255, 0)};
  color[] c = new color[3];
  
  int type;

  PVector pos;
  int size;
  float rad;
  float angle;

  // face 0: top, face 1: bottom, face 2: left, face 3; right, face 4: back, face 5: forward
  // colours: 0 orange, 1 white, 2 green, 3 blue, 4 red, 5 yellow

  Piece(int i0, int i1, int i2)
  {
    i[0] = i0;
    i[1] = i1;
    i[2] = i2;

    if (i[0] == 0 && i[1] == 0 && i[2] == 0)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[5]; // yellow front
      c[2] = colours[2]; // green left
    } else if (i[0] == 1 && i[1] == 0 && i[2] == 0)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[5]; // yellow front
      c[2] = colours[5]; // yellow front N/A
    } else if (i[0] == 2 && i[1] == 0 && i[2] == 0)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[5]; // yellow front
      c[2] = colours[3]; // blue right
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 1 && i[2] == 0)
    {
      c[0] = colours[5]; // yellow front
      c[1] = colours[2]; // green left
      c[2] = colours[2]; // green left N/A
    } else if (i[0] == 1 && i[1] == 1 && i[2] == 0)
    {
      c[0] = colours[5]; // yellow front
      c[1] = colours[5]; // yellow front N/A
      c[2] = colours[5]; // yellow front N/A
    } else if (i[0] == 2 && i[1] == 1 && i[2] == 0)
    {
      c[0] = colours[5]; // yellow front
      c[1] = colours[3]; // blue right
      c[2] = colours[3]; // blue right N/A
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 2 && i[2] == 0)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[5]; // yellow front
      c[2] = colours[2]; // green left
    } else if (i[0] == 1 && i[1] == 2 && i[2] == 0)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[5]; // yellow front
      c[2] = colours[5]; // yellow front N/A
    } else if (i[0] == 2 && i[1] == 2 && i[2] == 0)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[5]; // yellow front
      c[2] = colours[3]; // blue right
    }

    //________________________________________________________________________________________________________________________________
    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 0 && i[2] == 1)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[2]; // green left
      c[2] = colours[2]; // green left N/A
    } else if (i[0] == 1 && i[1] == 0 && i[2] == 1)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[0]; // orange top N/A
      c[2] = colours[0]; // orange top N/A
    } else if (i[0] == 2 && i[1] == 0 && i[2] == 1)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[3]; // blue right
      c[2] = colours[3]; // blue right N/A
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 1 && i[2] == 1)
    {
      c[0] = colours[2]; // green left
      c[1] = colours[2]; // green left N/A
      c[2] = colours[2]; // green left N/A
    } else if (i[0] == 1 && i[1] == 1 && i[2] == 1)
    {
      c[0] = colours[5]; // yellow front
      c[1] = colours[5]; // yellow front N/A
      c[2] = colours[5]; // yellow front N/A
    } else if (i[0] == 2 && i[1] == 1 && i[2] == 1)
    {
      c[0] = colours[3]; // blue right
      c[1] = colours[3]; // blue right N/A
      c[2] = colours[3]; // blue right N/A
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 2 && i[2] == 1)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[2]; // green left
      c[2] = colours[2]; // green left N/A
    } else if (i[0] == 1 && i[1] == 2 && i[2] == 1)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[4]; // red bottom N/A
      c[2] = colours[4]; // red bottom N/A
    } else if (i[0] == 2 && i[1] == 2 && i[2] == 1)
    {
      c[0] = colours[4]; //red bottom
      c[1] = colours[3]; //blue right
      c[2] = colours[3]; //blue right N/A
    }

    //________________________________________________________________________________________________________________________________
    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 0 && i[2] == 2)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[1]; // white back
      c[2] = colours[2]; // green left
    } else if (i[0] == 1 && i[1] == 0 && i[2] == 2)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[1]; // white back
      c[2] = colours[1]; // white back N/A
    } else if (i[0] == 2 && i[1] == 0 && i[2] == 2)
    {
      c[0] = colours[0]; // orange top
      c[1] = colours[1]; // white back
      c[2] = colours[3]; // blue right
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 1 && i[2] == 2)
    {
      c[0] = colours[1]; // white back
      c[1] = colours[2]; // green left
      c[2] = colours[2]; // green left N/A
    } else if (i[0] == 1 && i[1] == 1 && i[2] == 2)
    {
      c[0] = colours[1]; // white back
      c[1] = colours[1]; // white back N/A
      c[2] = colours[1]; // white back N/A
    } else if (i[0] == 2 && i[1] == 1 && i[2] == 2)
    {
      c[0] = colours[1]; // white back
      c[1] = colours[3]; // blue right
      c[2] = colours[3]; // blue right N/A
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 2 && i[2] == 2)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[1]; // white back
      c[2] = colours[2]; // green left
    } else if (i[0] == 1 && i[1] == 2 && i[2] == 2)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[1]; // white back
      c[2] = colours[1]; // white back N/A
    } else if (i[0] == 2 && i[1] == 2 && i[2] == 2)
    {
      c[0] = colours[4]; // red bottom
      c[1] = colours[1]; // white back
      c[2] = colours[3]; // blue right
    }

    size = 100;
    pos = new PVector(i[0] * size, i[1] * size, i[2] * size);
    
    if(dist(0, 0, 0, pos.x, pos.y, pos.z) <= 100) type = 0;
    else if(dist(0, 0, 0, pos.x, pos.y, pos.z) == size*sqrt(2)) type = 1;
    else if(dist(0, 0, 0, pos.x, pos.y, pos.z) == size*sqrt(3)) type = 2;
    
    switch(type)
    {
      case 0:
      rad = 0;
      break;
      
      case 1:
      rad = 100;
      break;
      
      case 2:
      rad = 100*sqrt(2);
      break;
    }
  }

  private void setFC(int f, color _c)
  {
    switch (f)        
    {
    case 0:

      pushMatrix();

      translate(pos.x, pos.y - size/2 + 1, pos.z);

      fill(_c);
      box(size, 2, size);

      popMatrix();

      break;

    case 1:

      pushMatrix();

      translate(pos.x, pos.y + size/2 - 1, pos.z);

      fill(_c);
      box(size, 2, size);

      popMatrix();

      break;

    case 2:

      pushMatrix();

      translate(pos.x - size/2 + 1, pos.y, pos.z);

      fill(_c);
      box(2, size, size);

      popMatrix();

      break;

    case 3:

      pushMatrix();

      translate(pos.x + size/2 - 1, pos.y, pos.z);

      fill(_c);
      box(2, size, size);

      popMatrix();

      break;

    case 4:

      pushMatrix();

      translate(pos.x, pos.y, pos.z - size/2 + 1);

      fill(_c);
      box(size, size, 2);

      popMatrix();

      break;

    case 5:

      pushMatrix();

      translate(pos.x, pos.y, pos.z + size/2 - 1);

      fill(_c);
      box(size, size, 2);

      popMatrix();

      break;
    }
  }

  void display()
  {    
    if (i[0] == 0 && i[1] == 0 && i[2] == 0)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[5]; // yellow front
      //c[2] = colours[2]; // green left

      setFC(0, c[0]);
      setFC(4, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 0 && i[2] == 0)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[5]; // yellow front
      //c[2] = colours[5]; // yellow front N/A

      setFC(0, c[0]);
      setFC(4, c[1]);
      setFC(4, c[2]);
    } else if (i[0] == 2 && i[1] == 0 && i[2] == 0)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[5]; // yellow front
      //c[2] = colours[3]; // blue right

      setFC(0, c[0]);
      setFC(4, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 1 && i[2] == 0)
    {
      //c[0] = colours[5]; // yellow front
      //c[1] = colours[2]; // green left
      //c[2] = colours[2]; // green left N/A

      setFC(4, c[0]);
      setFC(2, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 1 && i[2] == 0)
    {
      //c[0] = colours[5]; // yellow front
      //c[1] = colours[5]; // yellow front N/A
      //c[2] = colours[5]; // yellow front N/A

      setFC(4, c[0]);
      setFC(4, c[1]);
      setFC(4, c[2]);
    } else if (i[0] == 2 && i[1] == 1 && i[2] == 0)
    {
      //c[0] = colours[5]; // yellow front
      //c[1] = colours[3]; // blue right
      //c[2] = colours[3]; // blue right N/A

      setFC(4, c[0]);
      setFC(3, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 2 && i[2] == 0)
    {
      //c[0] = colours[4]; // red bottom
      //c[1] = colours[5]; // yellow front
      //c[2] = colours[2]; // green left

      setFC(1, c[0]);
      setFC(4, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 2 && i[2] == 0)
    {
      //c[0] = colours[4]; // red bottom
      //c[1] = colours[5]; // yellow front
      //c[2] = colours[5]; // yellow front N/A

      setFC(1, c[0]);
      setFC(4, c[1]);
      setFC(4, c[2]);
    } else if (i[0] == 2 && i[1] == 2 && i[2] == 0)
    {
      //c[0] = colours[4]; // red bottom
      //c[1] = colours[5]; // yellow front
      //c[2] = colours[3]; // blue right

      setFC(1, c[0]);
      setFC(4, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________
    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 0 && i[2] == 1)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[2]; // green left
      //c[2] = colours[2]; // green left N/A

      setFC(0, c[0]);
      setFC(2, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 0 && i[2] == 1)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[0]; // orange top N/A
      //c[2] = colours[0]; // orange top N/A

      setFC(0, c[0]);
      setFC(0, c[1]);
      setFC(0, c[2]);
    } else if (i[0] == 2 && i[1] == 0 && i[2] == 1)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[3]; // blue right
      //c[2] = colours[3]; // blue right N/A

      setFC(0, c[0]);
      setFC(3, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 1 && i[2] == 1)
    {
      //c[0] = colours[2]; // green left
      //c[1] = colours[2]; // green left N/A
      //c[2] = colours[2]; // green left N/A

      setFC(2, c[0]);
      setFC(2, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 1 && i[2] == 1)
    {
      //faceless
    } else if (i[0] == 2 && i[1] == 1 && i[2] == 1)
    {
      //c[0] = colours[3]; // blue right
      //c[1] = colours[3]; // blue right N/A
      //c[2] = colours[3]; // blue right N/A

      setFC(3, c[0]);
      setFC(3, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 2 && i[2] == 1)
    {
      //c[0] = colours[4]; // red bottom
      //c[1] = colours[2]; // green left
      //c[2] = colours[2]; // green left N/A

      setFC(1, c[0]);
      setFC(2, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 2 && i[2] == 1)
    {
      //c[0] = colours[0]; // red bottom
      //c[1] = colours[0]; // red bottom N/A
      //c[2] = colours[0]; // red bottom N/A

      setFC(1, c[0]);
      setFC(1, c[1]);
      setFC(1, c[2]);
    } else if (i[0] == 2 && i[1] == 2 && i[2] == 1)
    {
      //c[0] = colours[4]; //red bottom
      //c[1] = colours[3]; //blue right
      //c[1] = colours[3]; //blue right

      setFC(1, c[0]);
      setFC(3, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________
    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 0 && i[2] == 2)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[1]; // white back
      //c[2] = colours[2]; // green left

      setFC(0, c[0]);
      setFC(5, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 0 && i[2] == 2)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[1]; // white back
      //c[2] = colours[1]; // white back N/A

      setFC(0, c[0]);
      setFC(5, c[1]);
      setFC(5, c[2]);
    } else if (i[0] == 2 && i[1] == 0 && i[2] == 2)
    {
      //c[0] = colours[0]; // orange top
      //c[1] = colours[1]; // white back
      //c[2] = colours[3]; // blue right

      setFC(0, c[0]);
      setFC(5, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 1 && i[2] == 2)
    {
      //c[0] = colours[1]; // white back
      //c[1] = colours[2]; // green left
      //c[2] = colours[2]; // green left N/A

      setFC(5, c[0]);
      setFC(2, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 1 && i[2] == 2)
    {
      //c[0] = colours[1]; // white back
      //c[1] = colours[1]; // white back N/A
      //c[2] = colours[1]; // white back N/A

      setFC(5, c[0]);
      setFC(5, c[1]);
      setFC(5, c[2]);
    } else if (i[0] == 2 && i[1] == 1 && i[2] == 2)
    {
      //c[0] = colours[1]; // white back
      //c[1] = colours[3]; // blue right
      //c[2] = colours[3]; // blue right N/A

      setFC(5, c[0]);
      setFC(3, c[1]);
      setFC(3, c[2]);
    }

    //________________________________________________________________________________________________________________________________

    else if (i[0] == 0 && i[1] == 2 && i[2] == 2)
    {
      //c[0] = colours[4]; // red bottom
      //c[1] = colours[1]; // white back
      //c[2] = colours[2]; // green left

      setFC(1, c[0]);
      setFC(5, c[1]);
      setFC(2, c[2]);
    } else if (i[0] == 1 && i[1] == 2 && i[2] == 2)
    {
      //c[0] = colours[4]; // red bottom
      //c[1] = colours[1]; // white back
      //c[2] = colours[1]; // white back N/A

      setFC(1, c[0]);
      setFC(5, c[1]);
      setFC(5, c[2]);
    } else if (i[0] == 2 && i[1] == 2 && i[2] == 2)
    {
      //c[0] = colours[4]; // red bottom
      //c[1] = colours[1]; // white back
      //c[2] = colours[3]; // blue right

      setFC(1, c[0]);
      setFC(5, c[1]);
      setFC(3, c[2]);
    }

    pushMatrix();

    translate(pos.x, pos.y, pos.z);
    noFill();
    //stroke(255);
    box(size);

    popMatrix();
  }

  int[] getIndex()
  {
    return i;
  }

  void setIndexX(int n)
  {
    i[0] = n;
  }
  
  void setIndexY(int n)
  {
    i[1] = n;
  }
  
  void setIndexZ(int n)
  {
    i[2] = n;
  }
}