class Astroid {
  // member variables
  int x, y, health, speed, rad;
  PImage photo;

  // constructor
  Astroid(int x, int y) {
    this.x = x;
    this.y = y;
    health = 25;
    speed = int(random(2, 5));
    rad = 25;
    photo = loadImage("Astroid.png");
  }

  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }

  // member methods
  void display() {
    image(photo, x, y);
  }
  
  // Laser vs Astroid Intersection
  boolean laserIntersect(Laser laser){
    float distance = dist(x,y,laser.x,laser.y);
    if(distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }
}
