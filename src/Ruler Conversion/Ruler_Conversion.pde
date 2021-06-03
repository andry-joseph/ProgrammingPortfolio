void setup() {
  size(310, 400);
}

void draw() {
  background(128);
  //Title
  textAlign(CENTER);
  textSize(36);
  text("Ruler Conversion", width/2, 40);

  //Name & Instruction
  textSize(12);
  //fill(0);
  text(" Andry Joseph | October 12, 2020", width/2, 55);
  textAlign(LEFT);
  textSize(9);
  text("Instructions: Move mouse across the line to find your conversion.", 10, 80);

  //Measurement
  textSize(15);
  text("Inches to Centimenters:", 10, 120);
  text("Inches to Feet:", 10, 220);
  text("Inches to Yards:", 10, 320);

  //Inches to Centimeters
  line(10, 150, 300, 150);
  for (int i=10; i<300; i+=20) {
    line(i, 146, i, 154);
    textSize(8);
    textAlign(CENTER);
    text(i, i, 144);
  }
  ellipse(mouseX, 150, 5, 5);
  textSize(12);
  text("Centimeter: " + covertToCM(mouseX), mouseX, 165);

  //Inches to Feet
  line(10, 250, 300, 250);
  for (int i=10; i<300; i+=20) {
    line(i, 246, i, 254);
    textSize(8);
    textAlign(CENTER);
    text(i, i, 244);
  }
  ellipse(mouseX, 250, 5, 5);
  textSize(12);
  text("Feet: " + covertToFeet(mouseX), mouseX, 265);

  //Inches to Yard
  line(10, 350, 300, 350);
  for (int i=10; i<300; i+=20) {
    line(i, 346, i, 354);
    textSize(8);
    textAlign(CENTER);
    text(i, i, 344);
  }
  ellipse(mouseX, 350, 5, 5);
  textSize(12);
  text("Yard: " + covertToYard(mouseX), mouseX, 365);
}


float covertToCM(float val) {
  val = val*2.54;
  return val;
}

float covertToFeet(float val) {
  val = val/12;
  return val;
}

float covertToYard(float val) {
  val = val/36;
  return val;
}
