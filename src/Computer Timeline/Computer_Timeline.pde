//Andry Joseph | Computer Timeline
//September 15, 2020
boolean hover = false;

void setup() {
  size(1000, 400);
}

void draw() {
  background(173, 216, 230);
  println(hover);
  drawRef();
  histEvent(100, 200, 180, 25, "Computer Parts - 1833", "Charles Babbage invented all the parts that are now used for a modern computer.", true);
  histEvent(200, 275, 85, 25, "Z1 - 1936", "Konrad Zuse invented the first computer in the world called Z1.", false);
  histEvent(300, 200, 85, 25, "Z2 - 1939", "Konrad Zuse created the first mechanical computer in the world called Z2.", true);
  histEvent(400, 275, 170, 25, "Dynamic RAM - 1966", "Most common type of memory used today consisting of a transistor and a capacitor.", false);
  histEvent(500, 200, 100, 25, "Intel - 1968", "Intel, a semiconductor company, was founded by Gordon Moore", true);
  histEvent(600, 275, 140, 25, "Calculator - 1970", "First portable electronic calculators was invented in Japan.", false);
  histEvent(700, 200, 155, 25, "Floppy Disk - 1971", "First microprocessor (Intel 4004), first floppy disk (IBM).", true);
  histEvent(800, 275, 180, 25, "1 Gigabyte Disk - 1980", "It was realesed to the world starting at $40,000 and weighing 550 lbs.", false);
}

void drawRef() {
  //Draws the timeline
  strokeWeight(5);
  stroke(50);
  line(100, 250, 900, 250);

  //Draws the title info
  textAlign(CENTER);
  textSize(36);
  text("Computer Timeline", width/2, 65);

  //Descriptive text
  textSize(15);
  fill(0);
  text("Andry Joseph | September 2020", width/2, 90);
  text("This timeline shows the 8 different computer developments in the 1900s.", width/2, 130);
}

void histEvent(int x, int y, int w, int h, String title, String description, boolean top) {
  //Detection of the mouseover
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);

  //Draw a rectangle
  strokeWeight(2);
  if (hover == true) {
    fill(0);
    textAlign(LEFT);
    text(description, 200, 350);
    fill(255);
  } else {
    fill(255);
  }
  rect(x, y, w, h, 5);

  //Text overlay
  textAlign(LEFT);
  fill(0);
  text(title, x+5, y+20);

  //Connecting line to the timeline
  if (top == true) {
    line(x+20, y+25, x+35, y+50);
  } else {
    line(x+20, y, x+35, y-25);
  }
}
