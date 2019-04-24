float x, y;
float iconSize;
float menuLength;
boolean open;
Button buttons[] = new Button[1];

class SettingsMenu {
  
  SettingsMenu(float _x, float _y, float _iconSize, float _menuLength) {
    x = _x;
    y = _y;
    iconSize = _iconSize;
    menuLength = _menuLength;
    open = false;
    
    float buttonSeparation = 0.1*menuLength + iconSize/2;
    
    buttons[0] = new Button(x, y + buttonSeparation, iconSize);
  }
  
  void update() {
    if (buttons[0].pressed()) snapToGrid = (snapToGrid + 1) % 3;
  }
  
  void display() {
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].display("Snap:" + snapToGrid);
    }
  }
}