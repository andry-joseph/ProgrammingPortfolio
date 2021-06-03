class Button {
  //Member Variable
  int x,y,w,h;
  color c1, c2;
  String val;
  boolean hover;

  //Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c1 = #5B51A0;
    c2 = #A59DDE;
    val = tempVal;
    hover = false;
  }
  
  // Display Method
  void display() {
    if(hover) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x,y,w,h,8);
    fill(0);
    textAlign(LEFT);
    textSize(14);
    text(val,x+10,y+30);
  }
  
  //Hover Method
  void hover() {
    hover = (mouseX > x && mouseX<x+w && mouseY>y && mouseY <y+h);
  }
}
