class Piece {
  int ir, ic; // actual index
  int cinr, cinc; // current index
  PImage img;
  int connect[] = new int[4]; // -1 = in, 0 = none, 1 = out // 0, 1, 2, 3: top, bottom, left, right
  int connectComplement[] = {1, 0, 3, 2};
  float connectSize[] = new float[4];
  PImage connectImages[] = new PImage[4];
  PVector connectImagePos[] = new PVector[4];
  boolean used = false;
  boolean selected = false;
  boolean onBoard = false;
  float w, h;
  float x, y;
  float dx[] = {0, 0, w/2, -w/2};
  float dy[] = {h/2, -h/2, 0, 0};
  boolean mismatch[] = {false, false, false, false};

  Piece(int iR, int iC, PImage image, float wi, float he, float xpos, 
    float ypos, float top, float left, boolean bottomend, boolean rightend, 
    boolean topend, boolean leftend) {
    ir = iR;
    ic = iC;
    cinr = cinc = -2;
    img = image;
    w = wi;
    h = he;
    x = xpos;
    y = ypos;

    connect[0] = sign(top);
    connectSize[0] = abs(connect[0]*top);
    float r1 = random(-1, 1);
    connect[1] = int(!bottomend)*(sign(r1) == 0 ? sign(random(-1, 1)) : sign(r1)); 
    connectSize[1] = abs(connect[1]*random((w+h)/10, (w+h)/8));
    connect[2] = sign(left);
    connectSize[2] = abs(connect[2]*left);
    float r2 = random(-1, 1);
    connect[3] = int(!rightend)*(sign(r2) == 0 ? sign(random(-1, 1)) : sign(r2));
    connectSize[3] = abs(connect[3]*random((w+h)/10, (w+h)/8));

    //connectSize[0] = connectSize[1] = connectSize[2] = connectSize[3] = (w+h)/9; 

    img = image.get(int(x-w/2), int(y-h/2), int(w), int(h));

    for (int i = 0; i < connectImages.length; i++) {
      connectImagePos[i] = new PVector(x + int(i>1)*(2*int(i==3)-1)*(w/2+sign(connect[i])*connectSize[i]/2), 
        y + int(i<=1)*(2*int(i==1)-1)*(h/2+sign(connect[i])*connectSize[i]/2));

      if (connect[i] == 1) {
        connectImages[i] = image.get(int(connectImagePos[i].x - connectSize[i]/2), 
          int(connectImagePos[i].y - connectSize[i]/2), 
          int(connectSize[i]), int(connectSize[i]));
      }

      if (connect[i] == -1) {
        for (int a = int(-connectSize[i]/2); a <= connectSize[i]/2; a++) {
          for (int b = int(-connectSize[i]/2); b <= connectSize[i]/2; b++) {
            img.set(int(w/2 + connectImagePos[i].x - x) + a, int(h/2 + connectImagePos[i].y - y) + b, color(255, 0));
          }
        }
      }
    }
  }

  void display(color bg) {
    fill(128, 0);
    strokeWeight(2);
    stroke(extractOppositeColorFromImage(img));
    rect(x, y, w, h);
    image(img, x, y);
    for (int i = 0; i < connect.length; i++) {
      //if (connect[i] == -1) {
      //  fill(bg);
      //  stroke(bg, 0);
      //  rect(x + int(i>1)*(2*int(i==3)-1)*(w/2+sign(connect[i])*connectSize[i]/2), 
      //    y + int(i<=1)*(2*int(i==1)-1)*(h/2+sign(connect[i])*connectSize[i]/2), 
      //    connectSize[i], connectSize[i]);
      //}

      //switch (connect[i]*(i+1)) {
      //  case -4:
      //    rect(x+w/2-connectSize[3]/2, y, connectSize[3], connectSize[3]);
      //  break;

      //  case -3:
      //    rect(x-w/2+connectSize[2]/2, y, connectSize[2], connectSize[2]);
      //  break;

      //  case -2:
      //    rect(x, y+h/2-connectSize[1]/2, connectSize[1], connectSize[1]);
      //  break;

      //  case -1:
      //    rect(x, y-h/2+connectSize[0]/2, connectSize[0], connectSize[0]);
      //  break;

      //  case 1:
      //    rect(x, y-h/2-connectSize[0]/2, connectSize[0], connectSize[0]);
      //  break;

      //  case 2:
      //    rect(x, y+h/2+connectSize[1]/2, connectSize[1], connectSize[1]);
      //  break;

      //  case 3:
      //    rect(x-w/2-connectSize[2]/2, y, connectSize[2], connectSize[2]);
      //  break;

      //  case 4:
      //    rect(x+w/2+connectSize[3]/2, y, connectSize[3], connectSize[3]);
      //  break;
      //}
    }

    for (int i = 0; i < connect.length; i++) {
      connectImagePos[i].x = x + int(i>1)*(2*int(i==3)-1)*(w/2+sign(connect[i])*connectSize[i]/2); 
      connectImagePos[i].y = y + int(i<=1)*(2*int(i==1)-1)*(h/2+sign(connect[i])*connectSize[i]/2);

      if (connect[i] == 1) {
        strokeWeight(2);
        stroke(extractOppositeColorFromImage(img));
        rect(connectImagePos[i].x, connectImagePos[i].y, connectSize[i], connectSize[i]);
        image(connectImages[i], connectImagePos[i].x, connectImagePos[i].y);
      }

      if (mismatch[i]) {
        fill(255, 0, 0);
        rect(connectImagePos[i].x, connectImagePos[i].y, connectSize[i]/3, connectSize[i]/3);
      }
    }

    fill(255);
    rect(x, y, 50, 25);
    fill(0);
    text(cinr + " " + cinc, x, y);
  }

  void setSelected(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      selected = !selected;
      if (selected) {
        cinr = cinc = -2;
        mismatch[0] = mismatch[1] = mismatch[2] = mismatch[3] = false;
      }
    }
  }

  boolean isSelected() {
    return selected;
  }

  void selectEqual(boolean s) {
    selected = s;
  }

  void setPos(float mx, float my) {
    x = mx;
    y = my;
  }

  void displayConnectors() {
  }

  int isAdjacent(Piece piece) {
    if (abs((cinr - piece.cinr) + (cinc - piece.cinc)) == 1) {
      stroke(255);
      line(x, y, piece.x, piece.y);
      if (cinr < piece.cinr) {
        return 1;
      } else if (cinr > piece.cinr) {
        return 0;
      } else if (cinc < piece.cinc) {
        return 3;
      } else if (cinc > piece.cinc) {
        return 2;
      }
    }
    return -1;
  }

  void isMismatch(Piece piece) {
    int i = isAdjacent(piece);
    if (i != -1) {
      //if (cinr < 0 && cinc < 0 && piece.cinr < 0 && piece.cinc < 0) return;
      if (connect[i] != -piece.connect[connectComplement[i]] || connectSize[i] != piece.connectSize[connectComplement[i]]) {
        mismatch[i] = true;
        piece.setMismatch(connectComplement[i], true);
      } else {
        mismatch[i] = false;
        piece.setMismatch(connectComplement[i], false);
      }
    }
  }

  void setCurrentIndex(int cir, int cic) {
    cinr = cir;
    cinc = cic;
  }

  void setMismatch(int index, boolean bool) {
    mismatch[index] = bool;
  }
  
  void setAllMismatch(boolean b) {
    mismatch[0] = mismatch[1] = mismatch[2] = mismatch[3] = b;
  }
}