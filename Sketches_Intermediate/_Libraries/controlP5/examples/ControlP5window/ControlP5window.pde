import controlP5.*;

ControlP5 controlP5;

int myColorBackground = color(0,0,0);

ControlWindow controlWindow;

public int sliderValue = 40;

void setup() {
  size(400,400);
  frameRate(25);
  controlP5 = new ControlP5(this);
  controlP5.setAutoDraw(false);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,400,200);
  controlWindow.setBackground(color(40));
  Controller mySlider = controlP5.addSlider("sliderValue",0,255,40,40,100,10);
  mySlider.setWindow(controlWindow);
  controlP5.addSlider("sliderValue1",0,255,40,40,100,10);
}

void draw() {
  background(sliderValue);
  controlP5.draw();
}

void keyPressed() {
  if(key==',') controlP5.window("controlP5window").hide();
  if(key=='.') controlP5.window("controlP5window").show();
  // controlWindow = controlP5.addControlWindow("controlP5window2",600,100,400,200);
  // controlP5.controller("sliderValue1").moveTo(controlWindow);
}
