double value[] = {918726172, 0}; // write the values of each equation here // equation[i] = value[i]
double change[] = new double[value.length];
double x[] = new double[value.length];
double equation[] = new double[value.length];
String eq[] = new String[value.length];
double preveq[] = new double[value.length];

PrintWriter output;
IntList srno = new IntList();
int sr;
StringList values = new StringList();

void setup()
{
  size(600, 300, P3D);
  textAlign(CENTER);

  for (int i = 0; i < value.length; i++)
  {
    x[i] = -3.40282347E+38d; 
    change[i] = 1E+39d;
    preveq[i] = 0;
  }

  eq[0] = "911828177*x + 1929172 - (1921 + 1718297286 * 1/x)"; // write the equation here as it is written // this is not necessary
  eq[1] = "1721*x + 21 - (9367 - 2 * ((1/x) + 3 * 1/(2*x)))";

  output = createWriter("values.txt");
}

void draw()
{
  for (int i = 0; i < value.length; i++)
  {
    preveq[i] = equation[i];
  }

  equation[0] = 911828177*x[0] + 1929172 - (1921 + 1718297286 * 1/x[0]); // write the equation here
  equation[1] = 1721*x[1] + 21 - (9367 - 2 * ((1/x[1]) + 3 * 1/(2*x[1])));

  for (int i = 0; i < value.length; i++)
  {
    if (equation[i] >= value[i] - change[i] && equation[i] <= value[i] + change[i])
    {
      change[i] /= 10;
    }

    if ((preveq[i] < value[i] && equation[i] > value[i]) || (preveq[i] > value[i] && equation[i] < value[i]))
    {
      change[i] /= 10;
      change[i] *= -1;
    }

    if (equation[i] != value[i]) x[i] += change[i];

    background(0);

    text(eq[i] + " = " + value[i], width/2, height/2 - 100);

    text("x = " + x[i], width/2, height/2 - 50);

    text((float) equation[i] + " = " + value[i], width/2, height/2 + 50);
    text((float) change[i], width/2, height/2 + 100);

    if (equation[i] == value[i])
    { 
      for (int j = 0; j < values.size(); j++)
      {
        for (int k = 0; k < values.size(); k++)
        {
          if (values.get(j) == values.get(k))
          {
            values.remove(k);
            srno.remove(k);
          }
        }
      }

      sr = values.size();
      srno.append(sr); 
      values.append(")  " + eq[i] + "  |  x = " + x[i]);
    }
  }
}

void keyPressed()
{
  if (key == ESC)
  {
    key = 0;
    for (int i = 0; i < values.size(); i++) output.println(srno.get(i) + values.get(i));
    output.close();
    exit();
  }
}