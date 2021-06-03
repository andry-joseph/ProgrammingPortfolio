Button[] numButtons = new Button[10];
Button[] opButtons = new Button[11];
String dVal;
String op;
float r = 0.0;
float l = 0.0;
float result = 0.0;
boolean left = true;

void setup() {
  size(400, 425);
  dVal = "0";
  op = "";
  numButtons[0] = new Button(175, 350, 50, 50, "0");
  numButtons[1] = new Button(100, 275, 50, 50, "1");
  numButtons[2] = new Button(175, 275, 50, 50, "2");
  numButtons[3] = new Button(250, 275, 50, 50, "3");
  numButtons[4] = new Button(100, 200, 50, 50, "4");
  numButtons[5] = new Button(175, 200, 50, 50, "5");
  numButtons[6] = new Button(250, 200, 50, 50, "6");
  numButtons[7] = new Button(100, 125, 50, 50, "7");
  numButtons[8] = new Button(175, 125, 50, 50, "8");
  numButtons[9] = new Button(250, 125, 50, 50, "9");
  opButtons[0] = new Button(100, 350, 50, 50, "CLR");
  opButtons[1] = new Button(325, 362, 50, 50, "=");
  opButtons[2] = new Button(325, 300, 50, 50, "+");
  opButtons[3] = new Button(325, 237, 50, 50, "-");
  opButtons[4] = new Button(325, 175, 50, 50, "*");
  opButtons[5] = new Button(325, 112, 50, 50, "/");
  opButtons[6] = new Button(25, 200, 50, 50, "%");
  opButtons[7] = new Button(25, 125, 50, 50, "^");
  opButtons[8] = new Button(25, 275, 50, 50, "sin");
  opButtons[9] = new Button(25, 350, 50, 50, "cos");
  opButtons[10] = new Button(250, 350, 50, 50, ".");
}

void draw() {
  background(127);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
}

void mousePressed() {
  println("L:" + l + "R:" + r + "Op:" + op);
  println("Result:" + result + "Left:" + left);

  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length()<20) {
      if (left) {
        if (dVal.equals("0")) {
          dVal = (numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          l = float(dVal);
        }
      } else {
        if (dVal.equals("0")) {
          dVal = (numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          r = float(dVal);
        }
      }
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover && opButtons[i].val.equals("CLR")) {
      dVal = "0";
      result = 0.0;
      left = true;
      r = 0.0;
      l = 0.0;
      op = "";
    } else if (opButtons[i].hover && opButtons[i].val.equals("+")) {
      if (!left) {
        performCalc();
      } else {
        op = "+";
        left = false;
        dVal = "0";
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("=")) {
      performCalc();
    }
  }
}

void updateDisplay() {
  fill(80);
  rect(25, 25, 350, 80, 8);
  textSize(20);
  fill(255);
  textAlign(RIGHT);
  text(dVal, width-75, 80);
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("*")) {
    result = l * r;
  } else if (op.equals("/")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}
