import controlP5.*;

ControlP5 controlP5;

int myColorBackground = color(0,0,0);

String textValue = "";

Textfield myTextfield;

void setup() {
  size(400,400);
  frameRate(25);
  controlP5 = new ControlP5(this);
  myTextfield = controlP5.addTextfield("texts",100,160,200,20);
  myTextfield.setFocus(true);
  controlP5.addTextfield("textValue",100,200,200,20);
}

void draw() {
  background(myColorBackground);
}


void controlEvent(ControlEvent theEvent) {
  println("abc");
}

void mousePressed() {
  println(myTextfield.getText());
}


public void texts(String theText) {
  println("a textfield event. "+theText);
  println("textValue : "+textValue);
}
