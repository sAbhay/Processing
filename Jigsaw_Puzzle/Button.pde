class Button
{
  float x, y, r;

  Button(float x, float y, float r)
  {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  boolean pressed()
  {
    return dist(x, y, mouseX, mouseY) <= r;
  }
  
  void display(String text) {
    strokeWeight(2);
    stroke(128);
    fill(200);
    ellipse(x, y, r, r);
    fill(0);
    text(text, x, y);
  }
}