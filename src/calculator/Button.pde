class Button {
  // Variables
  PFont font;
  int x,y,w,h;
  String val;
  boolean hover,isNumber;
  color c1, c2;
  
  // constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    hover = false;
    c1 = #39E3AE;
    c2 = #ffaf36;
    font = createFont(".SFNSMono-Regular-48.vlw",26);
    this.isNumber = isNumber;
 }
 
 // Display button
 void display() {
   if (isNumber == true) {// number button
   if(hover) {
     fill(c2);
   } else {
     fill(c1);
   }
   //rectMODE(Center);
   rect(x,y,w,h,10);
   fill(255);
   textAlign(CENTER);
   textFont(font);
   text(val,x+w/2,y+40);
   } else { // non mumber button
     if(hover) {
     fill(c2);
   } else {
     fill(c1);
   }
   //rectMODE(Center);
   ellipse(x+w/2,y+h/2,w,h);
   fill(255);
   textAlign(CENTER);
   textFont(font);
   text(val,x+w/2,y+40);
   }
   
 }
 
 //Edge Detection
 void hover () {
   hover = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y+h;
 }
}
   
   
   
   
