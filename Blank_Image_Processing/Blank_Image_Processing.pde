PImage img;
PImage newimg;

void setup() 
{
  String image = "in_out.png";
  img = loadImage(image);
  newimg = new PImage(img.width, img.height);

  for (int i = 0; i < img.pixels.length; i++) 
  {
    //println(img.pixels[i]);
    if (img.pixels[i] >= color(200)) 
    {
      newimg.pixels[i] = color(0);
    } else {
      newimg.pixels[i] = img.pixels[i];
    }
  }

  newimg.save("/Users/abhaysinghal/Desktop/in_out.png");
}

void draw() 
{
}