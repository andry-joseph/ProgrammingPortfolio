float x, y, strokeW, pointCount;

void setup() {
  size(1000, 1000);
  x = random(width);
  y = random(height);
}

void draw() {
  strokeW = random(1, 5);
  pointCount = random(2, 15);
  stroke(random(50), random(50), random(255));
  if (x > width || x < 0 || y > height || y < 0) {
    x = random(width);
    y = random(height);
  } else {
    if (random(100) > 70) {
      strokeWeight(strokeW);
      moveRight(x,y,pointCount);
    } else if(random(100) > 60) {
      strokeWeight(strokeW);
      moveUp(x,y,pointCount);
    } else if(random(100) > 50) {
      strokeWeight(strokeW);
      moveLeft(x,y,pointCount);
    } else if(random(100) > 40) {
      strokeWeight(strokeW);
      moveDown(x,y,pointCount);
    }
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    x = startX + i;
    //y = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    x = startX - i;
    //y = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    //x = startX + i;
    y = startY-i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    //x = startX + i;
    y = startY+i;
  }
}
