class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  // Constructor
  Button (float x, float y, char val) {
    this.x = x ;
    this.y = y;
    this.val = val;
    w = 60;
    h = 60;
    c1 = color(50);
    c2 = color(#2D5270);
    hover = false;
  }

  // Member Methods
  void display() {
    if (hover == true) {
      fill(c1);
    } else {
      fill(c2);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 10);
    fill(255);
    textAlign(CENTER, CENTER );
    textSize(22);
    text(val, x, y-6);
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
