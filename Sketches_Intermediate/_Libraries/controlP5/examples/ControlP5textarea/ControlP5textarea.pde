import controlP5.*;

ControlP5 controlP5;
Textarea myTextarea;

void setup() {
  size(400,400);
  frameRate(30);
  controlP5 = new ControlP5(this);
  myTextarea = controlP5.addTextarea(
     "label1", 
     "a textarea is of type group, not controller.\n"+
     "you can set the width and height of a textarea, if there is more text than space available, scrollbars are added.  "+
     "use ALT + mouseDown to move the textarea.", 
     100,100,200,60);
  controlP5.addSlider("changeWidth",0,200,100,100,20,100,9);
  controlP5.addSlider("changeHeight",0,200,100,100,60,100,9);
  myTextarea.setColorForeground(0xffff0000);
}


void draw() {
  background(0);
  fill(255);  
}

void changeWidth(int theValue) {
  myTextarea.setWidth(theValue);
  // ((Textarea)controlP5.group("label1")).setWidth(theValue);
}

void changeHeight(int theValue) {
  myTextarea.setHeight(theValue);
}

