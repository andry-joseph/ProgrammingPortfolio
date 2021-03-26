class SpaceShip {
  // member variables
  int x, y, health, lives, rad;
  color c;
  float easing;

  //constructor
  SpaceShip(color c) {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    rad = 25;
    this.c = c;
    easing = 0.05;
  }

  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    rectMode(CENTER);
    stroke(127);
    fill(50);
    rect(x+20, y+15, 10, 15);
    rect(x-20, y+15, 10, 15);
    stroke(255, 140, 0);
    line(x+35, y+10, x+35, y);
    line(x-35, y+10, x-35, y);
    stroke(127);
    fill(100);
    triangle(x, y-20, x+40, y+15, x-40, y+15);
    fill(200);
    ellipse(x, y, 20, 80);
  }

  // Astroid vs Ship Collision
  boolean astroidIntersect(Astroid astroid) {
    float distance = dist(x, y, astroid.x, astroid.y);
    if (distance < rad + astroid.rad) {
      return true;
    } else {
      return false;
    }
  }
}
