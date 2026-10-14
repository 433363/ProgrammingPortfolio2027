// Elle Birgenheier | September 14 2026 | Calculator
// Color palette #8EAFCB #2D5270 50
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[14];

void setup () {
  size(340, 600);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;
  numButtons[0]= new Button(50, 200, '0');
  numButtons[1]= new Button(130, 200, '1');
  numButtons[2]= new Button(210, 200, '2');
  numButtons[3]= new Button(50, 280, '3');
  numButtons[4]= new Button(130, 280, '4');
  numButtons[5]= new Button(210, 280, '5');
  numButtons[6]= new Button(50, 360, '6');
  numButtons[7]= new Button(130, 360, '7');
  numButtons[8]= new Button(210, 360, '8');
  numButtons[9]= new Button(50, 440, '9');
  opButtons[0]= new Button(50, 520, '<');
  opButtons[1]= new Button(130, 520, '>');
  opButtons[2]= new Button(210, 520, '√');
  opButtons[3]= new Button(290, 520, '=');
  opButtons[4]= new Button(130, 440, '.');
  opButtons[5]= new Button(210, 440, 'π');
  opButtons[6]= new Button(290, 440, '+');
  opButtons[7]= new Button(290, 360, '-');
  opButtons[8]= new Button(290, 280, 'x');
  opButtons[9]= new Button(290, 200, '÷');
  opButtons[10]= new Button(50, 120, '±');
  opButtons[11]= new Button(130, 120, '%');
  opButtons[12]= new Button(210, 120, '⌫');
  opButtons[13]= new Button(290, 120, 'C');
}


void draw() {
  background(#8EAFCB);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  // Background shape
  rect(width/2, 45, 300, 75, 8);
  //Overlay text
  fill(0);
  textAlign(RIGHT);
  textSize(38);
  text(displayVal, width-30, 65);
}

void mouseReleased() {
  // Refresh hover for the exact release position
  for (int i = 0; i < numButtons.length; i++ ) {
    numButtons[i].mouseOver(mouseX, mouseY);
  }

  for (int i = 0; i < opButtons.length; i++ ) {
    opButtons[i].mouseOver(mouseX, mouseY);
  }


  //Number buttons
  for (int i = 0; i < numButtons.length; i++ ) {
    if (numButtons[i].hover ==true) {
      handleEvent(numButtons[i].val, true);
    }
  }

  // Operator buttons
  for (int i = 0; i < opButtons.length; i++ ) {
    if (opButtons[i].hover == true) {
      char clicked = opButtons[i].val;

      if (clicked == '=') {
        performCalc();
      } else if (clicked == 'q') {
      } else if (clicked == '+' || clicked == '-' || clicked == 'x' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
      } else if (clicked == 'C') {
        displayVal = "0.0";
        l = 0.0;
        r = 0.0;
        op = ' ';
        left = true;
        newEntry = true;
      } else if (clicked == 'π') {
        displayVal = str(PI);
        if (left) {
          l = PI;
        } else {
          r = PI;
        }
      }  else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          if (left == true) {
            displayVal += ".";
            r = float(displayVal);
          }
        }
      }
    }
  }
}



////if (left == true) {
////  l = sq(l);
////  displayVal =str(1);
////} else {
////  r = sq(r);
////  displayVal=str(r);
////}
//}
//}

//printState();
//// }
//// }
//}



      




void printState() {
  println(
    "l; " + l +
    " | r; " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op +
    " | display: " + displayVal
    );
}





void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  }

  displayVal = str(result);
  println("AFTER CALC -> result: " + result + " | displayVal: " + displayVal);
  //l = result;
  //r = 0.0;
  left = true;
  newEntry = true;
}

void keyPressed() {
  if (key == '1') {
    println("You hit 1" + keyCode );
    handleEvent('1', true);
  } else if (key == '2' || keyCode == 99) {
    println("You hit 2" + keyCode );
    handleEvent('2', true);
  } else if (key == '3' || keyCode == 99) {
    println("You hit 3" + keyCode );
    handleEvent('3', true);
  } else if (key == '4' || keyCode == 99) {
    println("You hit 4" + keyCode );
    handleEvent('4', true);
  } else if (key == '5' || keyCode == 99) {
    println("You hit 5" + keyCode );
    handleEvent('5', true);
  } else if (key == '6' || keyCode == 99) {
    println("You hit 6" + keyCode );
    handleEvent('6', true);
  } else if (key == '7' || keyCode == 99) {
    println("You hit 7" + keyCode );
    handleEvent('7', true);
  } else if (key == '8' || keyCode == 99) {
    println("You hit 8" + keyCode );
    handleEvent('8', true);
  } else if (key == '9' || keyCode == 99) {
    println("You hit 9" + keyCode );
    handleEvent('9', true);
  } else if (key == '0' || keyCode == 99) {
    println("You hit 0" + keyCode );
    handleEvent('0', true);
}
}


void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    String digit =str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }
    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // other stuff
  }
}
