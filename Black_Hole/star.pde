class Entity
{
  private PVector pos;
  private PVector dir;
  private int size;
  private color colour;

  Entity(PVector start, PVector target, int _size, color _colour)
  {
    pos = new PVector(start.x, start.y, 0);
    dir = new PVector(target.x, target.y, 0);

    dir = PVector.sub(target, start);
    dir.normalize();
    dir.mult(attractionSpeed);

    size = _size;
    colour = _colour;
  }

  public void display()
  {
    fill(colour);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    ellipse(0, 0, size, size);
    popMatrix();
  }

  public void move()
  {
    pos.add(dir);
  }
}