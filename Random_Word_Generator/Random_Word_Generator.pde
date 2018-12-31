import rita.*;

StringList words = new StringList();

RiLexicon lexicon;

ArrayList<List> lists = new ArrayList<List>();

int control;

int columnSize;
int textSize = 18;
int columnPos;

float mouseMovement;

void setup()
{
  fullScreen();

  lexicon = new RiLexicon();

  newWord();

  columnSize = (int) (textSize * (25/3));

  columnPos = (int) (columnSize/2);

  textAlign(CENTER);

  // "Rhyme" yields words that rhyme with words.get(control)
  // "Sound" yields words that are similar by sound
  // "Letter" yields words that are similar by letter
  // "S + L" yields words that are similar by sound and letter

  // Important: use only these Strings in the List constructor

  lists.add(new List(columnPos, "Rhyme"));
  lists.add(new List(columnPos + columnSize, "Sound"));
  lists.add(new List(columnPos + columnSize * 2, "Letter"));
  lists.add(new List(columnPos + columnSize * 3, "S + L"));

  for (int i = 0; i < lists.size(); i++)
  {
    lists.get(i).refresh(words.get(control));
  }
}

void draw()
{
  background(0);

  textSize(24);
  text(control, width - 100, height - 100);

  for (int i = 0; i < lists.size(); i++)
  {
    lists.get(i).display();
  }

  showWord();
}


void keyPressed()
{
  if (key == ' ')
  {
    control++;
    newWord();

    for (int i = 0; i < lists.size(); i++)
    {
      lists.get(i).refresh(words.get(control));
    }
  }
}

void newWord()
{
  words.append(lexicon.randomWordByLength((int) random(7, 10)));
}

void showWord()
{
  fill(0);
  stroke(0);
  rect(width/2 - words.get(control).length() * 20, height/2 - 70, words.get(control).length() * 40, 100);

  fill(255);
  textSize(72);
  text(words.get(control), width/2, height/2);
}

void mouseWheel(MouseEvent event)
{
  mouseMovement = event.getCount();
  
  for(int i = 0; i < lists.size(); i++)
  {
   lists.get(i).scroll(); 
  }
}