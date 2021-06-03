class Car {
  // member variables
  color c;
  float xpos, ypos, xspeed;
  boolean right;

  //Constructor
  Car(color c) {
    this.c = c;
    xpos = random(width);
    ypos = random(height);
    xspeed = random(1, 5);
    if (random(10)>5) {
      right = true;
    } else {
      right = false;
    }
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10, 4);
    fill(0);
    rect(xpos-7, ypos-4, 5, 3);
    rect(xpos-7, ypos+4, 5, 3);
    rect(xpos+7, ypos-4, 5, 3);
    rect(xpos+7, ypos+4, 5, 3);
  }

  void drive() {
    if (right) {
      xpos += xspeed;
      if (xpos > width) {
        xpos = 0;
      } else {
        xpos -= xspeed;
        if (xpos < 0) {
          xpos = width;
        }
      }
    }
  }
}
