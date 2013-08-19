import controlP5.*;

ControlP5 controlP5;

Textlabel myTextlabel;

void setup() {
  size(400,400);
  frameRate(30);
  controlP5 = new ControlP5(this);

  Textlabel t = controlP5.addTextlabel("label","A SINGLE TESTLABEL.",20,134);
  t.setColorValue(0xffffff00);
  
  myTextlabel = new Textlabel(this,"a single textlabel.",20,100,400,200,0xffff0000,ControlP5.synt24);
  myTextlabel.setLetterSpacing(2);
}


void draw() {
  background(0);
  myTextlabel.draw(this); 
}
