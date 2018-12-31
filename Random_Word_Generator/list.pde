class List
{
  private String[] wordType = new String[2000];
  private float[] y = new float[wordType.length];
  private int x;
  private String type;

  List(int _x, String _type)
  {
    x = _x;

    type = _type;
  }

  public void display()
  {
    for (int i = 0; i < wordType.length; i++)
    {
      fill(255);
      textSize(textSize);
      text(wordType[i], x, y[i]);
    }

    stroke(0);
    fill(0);
    rect(x - columnSize/2, 0, columnSize, textSize * 2.25);

    stroke(255);
    //line(x - columnSize/2, 0, x - columnSize/2, height);
    //line(x + columnSize/2, 0, x + columnSize/2, height);
    line(x - columnSize/2, textSize * 2.25, x + columnSize/2, textSize * 2.25);

    fill(255);
    textSize(textSize * 1.5);
    text(type, x, 30);

    //move();

    if (y[0] > textSize * 3.6)
    {
      //y[0] = textSize * 3.6;
    }
  }

  public void refresh(String baseWord)
  {
    wordType = null;

    if (type == "Rhyme")
    {
      wordType = lexicon.rhymes(baseWord);
    } else if (type == "Sound")
    {
      wordType = lexicon.similarBySound(baseWord);
    } else if (type == "Letter")
    {
      wordType = lexicon.similarByLetter(baseWord);
    } else if (type == "S + L")
    {
      wordType = lexicon.similarBySoundAndLetter(baseWord);
    }

    for (int i = 0; i < y.length; i++)
    {
      y[i] = i * (textSize * 1.8) + textSize * 3.6;
    }
  }

  public void scroll()
  {
    if (mouseX >= x - columnSize/2 && mouseX <= x + columnSize/2)
    {
      for (int i = 0; i < wordType.length; i++)
      {
        y[i] -= mouseMovement * 2;
      }
    }
  }

  public String getWord(int number)
  {
    return wordType[number];
  }
}