import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

ArrayList<Cell> c = new ArrayList<Cell>();

int cellSize;

int grid[][] = {
  {1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1}, 
  {1, 1, 0, 1, 1}, 
  {1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1}};

PeasyCam cam;

void setup()
{
  fullScreen(P3D);

  if (height/grid[0].length < width/grid.length)
  {
    cellSize = height/grid[0].length;
  } else
  {
    cellSize = width/grid.length;
  }

  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      if (grid[i][j] == 1)
      {
        c.add(new Cell(i * cellSize + width/2 - ((grid.length + 0.25)/2) * cellSize, j * cellSize, cellSize, true, j, i));
      }
    }
  }

  //cam = new PeasyCam(this, 0, 0, 0, 0);
}

void draw()
{
  background(0);
  
  for (int i = 0; i < c.size(); i++)
  {
    c.get(i).display();
  }
}

void mouseClicked()
{
  for (int i = 0; i < c.size(); i++)
  { 
    if (mouseX > c.get(i).x && mouseX < c.get(i).x + c.get(i).size && mouseY > c.get(i).y && mouseY < c.get(i).y + c.get(i).size)
    {
      c.get(i).change();

      for (int j = 0; j < c.size(); j++)
      {
        if (c.get(i).indexSide > 0)
        {
          if (c.get(j).indexSide == c.get(i).indexSide - 1 && c.get(j).indexUp == c.get(i).indexUp)
          {
            c.get(j).change();
          }
        }

        if (c.get(i).indexSide < grid.length - 1)
        {
          if (c.get(j).indexSide == c.get(i).indexSide + 1 && c.get(j).indexUp == c.get(i).indexUp)
          {
            c.get(j).change();
          }
        }

        if (c.get(i).indexUp > 0)
        {
          if (c.get(j).indexSide == c.get(i).indexSide && c.get(j).indexUp == c.get(i).indexUp - 1)
          {
            c.get(j).change();
          }
        }

        if (c.get(i).indexUp < grid[0].length)
        {
          if (c.get(j).indexSide == c.get(i).indexSide && c.get(j).indexUp == c.get(i).indexUp + 1)
          {
            c.get(j).change();
          }
        }
      }
    }
  }
}