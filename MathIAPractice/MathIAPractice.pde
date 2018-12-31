IntList fibSeq = new IntList();
int numDigits = 0;
long num[] = new long[10];
double freq[] = new double[num.length];
int seqlen = 2000;

int countOccurrences(long x, int d)
{
  int count = 0;  // Initialize count of digit d
  while (x != 0)
  {
    // Increment count if current digit is same as d
    if (x%num.length == d)
      count++;
    x = x/num.length;
  }
  return count;
}

int leadingDigit(int n)
{
  int x = abs(n); // Handle negative numbers

  while (x > 9)
  {
    x /= 10;
  }
  return (int) x;
}

void setup()
{
  fibSeq.append(0);
  fibSeq.append(1);

  int n = 1;

  while (n < seqlen)
  {
    //println(n);
    fibSeq.append(fibSeq.get(n-1) + fibSeq.get(n));
    print(fibSeq.get(n+1) + " ");

    //for (int i = 0; i < num.length; i++)
    //{
    //num[i] += countOccurrences(fibSeq.get(n+1), i);
    //}

    num[leadingDigit(fibSeq.get(n+1))]++;

    n++;
  }

  for (int i = 0; i < num.length; i++)
  {
    freq[i] = 0;
    numDigits += num[i];

    println(num[i]);
  }

  //println(numDigits);

  double s = 0;

  for (int i = 0; i < num.length; i++)
  {
    freq[i] = num[i]*pow(seqlen, -1);

    println(freq[i]);

    s += freq[i];
  }

  //println(s);
}

void draw()
{
}