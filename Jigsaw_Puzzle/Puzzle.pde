class Puzzle {
  PImage img;
  int np, nr, nc;
  float w, h;
  float x, y;
  Piece pieces[][];
  PVector gridPos[][];

  Puzzle(String path, int num) {
    img = loadImage(path);
    np = num;
    img.resize(width, height);
    w = h = sqrt(img.width*img.height/np);
    //img.resize(int(w), int(h));
    if (img.width % w != 0) {
      img.resize(int(img.width - (img.width % w)), img.height);
    }
    if (img.height % h != 0) {
      img.resize(img.width, int(img.height - (img.height % h)));
    }
    println(w);
    println(img.width);
    nc = int(img.width/w);
    nr = int(img.height/h);
    pieces = new Piece[nr][nc];
    gridPos = new PVector[nr][nc];
    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        pieces[r][c] = new Piece(r, c, img, w, h, x+w/2+c*w, y+h/2+r*h, 
          r == 0 ? 0 : -pieces[r-1][c].connectSize[1]*pieces[r-1][c].connect[1], 
          c == 0 ? 0 : -pieces[r][c-1].connectSize[3]*pieces[r][c-1].connect[3], 
          (r == nr-1), (c == nc-1), (r == 0), (c == 0));

        gridPos[r][c] = new PVector(x+w/2+c*w, y+h/2+r*h);
      }
    }
  }

  void display(color bg) {
    fill(0, 0);
    strokeWeight(4);
    stroke(0);
    rect(x+nc*w/2, y+nr*h/2, nc*w, nr*h);

    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        pieces[r][c].display(bg);
      }
    }

    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        pieces[r][c].displayConnectors();
      }
    }

    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        if (pieces[r][c].isSelected()) pieces[r][c].display(bg);
      }
    }
  }

  boolean updateSelection(int mx, int my) {
    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        if (snapToGrid != 0 && pieces[r][c].isSelected()) {
          for (int i = 0; i < gridPos.length; i++) {
            for (int j = 0; j < gridPos[i].length; j++) {
              if (snapToGrid == 1 && ((i != 0 && i != gridPos.length-1)
                || ((j != 0 && j != gridPos[i].length-1)))) {
                break;
              }
              if (dist(mx, my, gridPos[i][j].x, gridPos[i][j].y) < (w+h)/3) {
                pieces[r][c].setPos(gridPos[i][j].x, gridPos[i][j].y);
                pieces[r][c].setCurrentIndex(i, j);
              }
            }
          }
        }
        pieces[r][c].setSelected(mx, my);
        if (pieces[r][c].isSelected()) {
          return true;
        }
      }
    }
    return false;
  }

  void updatePos(int mx, int my) {
    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        if (pieces[r][c].isSelected()) {
          pieces[r][c].setPos(mx, my);
        }
      }
    }
  }

  void checkMismatch(int snap) {
    if (snap == 2) {
      for (int r = 0; r < nr; r++) {
        for (int c = 0; c < nc; c++) {
          for (int i = 0; i < nr; i++) {
            for (int j = 0; j < nc; j++) {
              if (r != i && c != j) {
                pieces[r][c].isMismatch(pieces[i][j]);
              }
            }
          }
        }
      }
    }
  }

  void randomize() {
    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        pieces[r][c].x = random(0, (nc-1)*w);
        pieces[r][c].y = random(0, (nr-1)*h);
      }
    }
    for (int r = 0; r < nr; r++) {
      for (int c = 0; c < nc; c++) {
        for (int i = 0; i < nr; i++) {
          for (int j = 0; j < nc; j++) {
            if (r != i && c != j) {
              pieces[r][c].setSelected(int(pieces[i][j].x), int(pieces[i][j].y));
              while (pieces[r][c].isSelected()) {
                pieces[r][c].x = random(0, (nc-1)*w);
                pieces[r][c].y = random(0, (nr-1)*h);
                pieces[r][c].setSelected(int(pieces[i][j].x), int(pieces[i][j].y));
                for (int a = 0; a < nr; a++) {
                  for (int b = 0; b < nc; b++) {
                    pieces[r][c].setSelected(int(pieces[a][b].x), int(pieces[a][b].y));
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}