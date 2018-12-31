import java.io.File;
String fileExtension = ".png";
String dir = "/Users/abhaysinghal/Downloads/flags-normal";

public void readImagesPath(String dir){
   File folder = new File(dir);
   File[] listOfFiles = folder.listFiles();

    for (File file : listOfFiles) {
      if (file.isFile()) {
         System.out.println(file.getName());
      }
    }
 }

PImage images;
int i=0;

File folder;
File[] imageNames;

void setup(){
  fullScreen();
  folder = new File(dir);
  println(folder);
  imageNames = folder.listFiles();
  //printArray(imageNames);
}

void draw(){
  if(i < imageNames.length)
  {
    //delay(50);
    images = loadImage(imageNames[i].toString());
    tint(255, 255/imageNames.length);
    image(images,0,0);
    i++;
  }
}