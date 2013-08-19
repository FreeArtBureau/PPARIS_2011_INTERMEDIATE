import controlP5.*;

ControlP5 controlP5;


void setup() {
  size(400,400);
  frameRate(30);
  controlP5 = new ControlP5(this);
  ScrollList l = controlP5.addScrollList("myList",100,100,120,280);
  
  controlP5.addTab("new");
  
  l.setLabel("something else");
  for(int i=0;i<40;i++) {
    controlP5.Button b = l.addItem("a"+i,i);
    b.setId(100 + i);
  }
}

void myList(int theValue) {
  println("ddd");
}
void controlEvent(ControlEvent theEvent) {
  println(theEvent.controller().id()+"  /  "+
        theEvent.controller()+"  /  "+
        theEvent.controller().value()
        );
}


void draw() {
  background(0);
}
