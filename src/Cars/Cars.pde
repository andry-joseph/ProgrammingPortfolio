Car[] cars = new Car[100];

void setup() {
  size(500, 500);
  for(int i=0; i<cars.length; i++) {
    cars[i] = new Car(color(random(255),random(255),random(255)));
  }
}

void draw() {
  background(255);
  for(int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}
