// SpaceGame 2021
// by Andry Joseph

SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Astroid> astroids;
ArrayList<Star> stars;
Timer timer;
int pass, score;
boolean play;

void setup() {
  size(500, 500);
  s1 = new SpaceShip(#DB9494);
  lasers = new ArrayList();
  astroids = new ArrayList();
  stars = new ArrayList();
  timer = new Timer(int(random(1000, 5000)));
  timer.start();
  score = 0;
  pass = 0;
  play = false;
}

void draw() {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), int(random(height)), color(random(190, 255))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    if (timer.isFinished()) {
      astroids.add(new Astroid(int(random(width)), -50));
      timer.start();
    }

    for (int i = 0; i < astroids.size(); i++) {
      Astroid astroid = astroids.get(i);
      astroid.display();
      astroid.move();
      // Astroid vs Ship Collision
      if (s1.astroidIntersect(astroid)) {
        s1.health-=astroid.health;
        astroids.remove(astroid);
        score+=astroid.health;
      }
      if (astroid.reachedBottom()) {
        pass++;
        astroids.remove(astroid);
      }
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.fire();
      // Laser vs Astroid Intersection
      for (int j = 0; j < astroids.size(); j++) {
        Astroid astroid = astroids.get(j);
        if (astroid.laserIntersect(laser)) {
          astroid.health-=10;
          lasers.remove(laser);
          if (astroid.health<1) {
            astroids.remove(astroid);
            score+=astroid.health;
          }
          
          // GameOver Logic
          if (s1.health < 1 || pass>10) {
            play = false;
            gameOver();
          }
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    s1.display(mouseX, mouseY);
    infoPanel();
  }
}

void mousePressed() {
  lasers.add(new Laser(color(255, 0, 0), s1.x, s1.y));
}

void keyPressed() {
  // use spaecebar for firing
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("Welcome!", width/2, height/2);
  text("Click to Continue...", width/2, height/2+20);
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  fill(255, 128);
  text("Health: " + s1.health, 20, height-20);
  text("Lives: " + s1.lives, 150, height-20);
  text("Level: ", 200, height-20);
  text("Score: " + score, 250, height-20);
  text("Pass: " + pass, 420, height-30);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+20);
  noLoop();
}
