import rita.*;

RiMarkov markov;

String[] files = {"../data/values.rtf"};

String line = "Click to generate text";
int x, y;

int numberOfSentences = 1000;

void setup()
{
  fullScreen();
  
  markov = new RiMarkov(2);
  
  x = width/2 - 100;
  y = height/2;
  
  markov.loadFrom(files, this);
}

void draw()
{
  background(255);
  
  fill(0);
  text(line, x, y, width - 100, (height/50) * numberOfSentences);
}

void mouseClicked()
{
  x = y = 50;
  String[] lines = markov.generateSentences(numberOfSentences);
  line = RiTa.join(lines, " ");
}

void mouseWheel(MouseEvent event)
{
  y -= event.getCount();
}