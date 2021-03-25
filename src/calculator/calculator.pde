/////////////////////////////////////////
//2020 calculator project|Dhruv Reddy
////////////////////////////////////////
Button[] numButtons = new Button[10];
Button[] nonNum = new Button[14];
String dVal, op; 
boolean left;
float l,r,result;

void setup() {
 size (375,400);
 dVal = "0";
 op = "";
 left = true;
 l = 0.0;
 r = 0.0;
 result = 0.0;
 numButtons[0] = new Button(0,350,150,50,"0",true);
 numButtons[1] = new Button(0,300,75,50,"1",true);
 numButtons[2] = new Button(75,300,75,50,"2",true);
 numButtons[3] = new Button(150,300,75,50,"3",true);
 numButtons[4] = new Button(0,250,75,50,"4",true);
 numButtons[5] = new Button(75,250,75,50,"5",true);
 numButtons[6] = new Button(150,250,75,50,"6",true);
 numButtons[7] = new Button(0,200,75,50,"7",true);
 numButtons[8] = new Button(75,200,75,50,"8",true);
 numButtons[9] = new Button(150,200,75,50,"9",true);
 nonNum[0] = new Button(0,150,75,50,"C",false);
 nonNum[1] = new Button(150,350,75,50,".",false);
 nonNum[2] = new Button(225,350,75,50,"=",false);
 nonNum[3] = new Button(225,300,75,50,"+",false);
 nonNum[4] = new Button(225,250,75,50,"-",false);
 nonNum[5] = new Button(225,200,75,50,"x",false);
 nonNum[6] = new Button(225,150,75,50,"÷",false);
 nonNum[7] = new Button(75,150,75,50,"±",false);
 nonNum[8] = new Button(150,150,75,50,"%",false);
 nonNum[9] = new Button(300,300,75,50,"cos",false);
 nonNum[10] = new Button(300,350,75,50,"Rand",false);
 nonNum[11] = new Button(300,250,75,50,"sin",false);
 nonNum[12] = new Button(300,200,75,50,"√",false);
 nonNum[13] = new Button(300,150,75,50,"x²",false);
}

void draw() {
background(#F4F54A);
updateDisplay();

for (int i=0; i<numButtons.length; i++) {
numButtons[i].display();
numButtons[i].hover();

  }
  for (int i=0; i<nonNum.length; i++) {
nonNum[i].display();
nonNum[i].hover();

  }
}



void updateDisplay() {
  fill(60);
 rect(20,20,width-35,110);
 fill(255);
 
 
 textAlign(RIGHT);
 
 
 if (dVal.length()<13) {
    textSize(36);
  } else if (dVal.length()<14) {
    textSize(34);
  } else if (dVal.length()<15) {
    textSize(32);
  } else if (dVal.length()<17) {
    textSize(30);
  } else if (dVal.length()<19) {
    textSize(28);
  } else if (dVal.length()<21) {
    textSize(26);
  } else if (dVal.length()<23) {
    textSize(24);
  } else if (dVal.length()<25) {
    textSize(22);
  } else {
    textSize(20);
  }
  text(dVal,width-25,65);
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length()<20) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<nonNum.length; i++) {
    if (nonNum[i].hover) {
      handleEvent(nonNum[i].val, false);
    }
  }
}

void keyPressed() {
  println("KEY:" + key + " keyCode:" + keyCode);

  if (key == '0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("x", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 'C') {
    handleEvent("C", false);
  } else if (key == 10) { //(key == CODED) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("=", false);
    }
  } else if(keyCode == 27)  {
    key = 0;
    if (key == 0) {
      handleEvent("C", false);
    }
  }
}

String handleEvent(String val, boolean num) {
  if (left & num) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      l = float(dVal);
    } else { 
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0") || result == l) {
      dVal = (val);
      r = float(dVal);
    } else { 
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
    
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")) {
    op = "-";
    left = false;
    dVal = "0";
  } else if (val.equals("x")) {
    op = "x";
    left = false;
    dVal = "0";
  } else if (val.equals("÷")) {
    op = "÷";
    left = false;
    dVal = "0";
  } else if (val.equals("=")) {
    performCalc();
  
} else if (val.equals("%")) {
    if (left) {
      l *= 0.1;
      dVal = str(l);
    } else {
      r *= 0.1;
      dVal = str(r);
    }
} else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("±")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("sin")) {
    if (left) {
      l = sin(radians(l));
      dVal = str(l);
    } else {
      r = sin(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("cos")) {
    if (left) {
      l = cos(radians(l));
      dVal = str(l);
    } else {
      r = cos(radians(r));
      dVal = str(r);
    }
  } else if (val.equals("Rand")) {
    if (left) {
      l = random(0, 1);
      dVal = str(l);
    } else {
      r = random(0, 1);
      dVal = str(r);
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
    l = float(dVal);
  } else {
    dVal += (val);
    r = float(dVal);
  
  }
  return val;
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}
