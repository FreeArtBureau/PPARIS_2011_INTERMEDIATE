// OpenGL
import processing.opengl.*;

// Control P5
import controlP5.*;
ControlP5 controlP5;
ControlWindow controlWindow;


// Box2D
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

PBox2D box2d;
ArrayList boundaries;
ArrayList particles;
float rMin = 10.0f, rMax = 16.0f;
Boundary leftWall,rightWall,bottomWall;

// Colors
color colorBubbles  = #000000;
color colorCountour = colorBubbles;
color colorBg       = #FFFFFF;

// Timer
Timer timer;

// Image
PImage img;

// ------------------------------------
// setup
void setup()
{
  size(800,600,OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  smooth();

  // Initialize box2d physics and create the world
  box2d = new PBox2D(this);
  box2d.createWorld();

  leftWall = new Boundary(0,height/2,10,height,0);
  rightWall = new Boundary(width,height/2,10,height,0);
  bottomWall = new Boundary(width/2,height,width,10,0);


  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,400,200);

  // Gravity property + control
  float gravity = 0;

  Controller gravitySlider = controlP5.addSlider("gravity",-20,20,gravity,5,5,100,14);
  gravitySlider.setId(0);
  gravitySlider.setWindow(controlWindow);

  box2d.setGravity(0, gravity);


  // We are setting a custom gravity
  particles  = new ArrayList();

  // Load our image
  img = loadImage("Book.jpg");

  // Timer
  timer = new Timer();
}


// ------------------------------------
// draw
void draw()
{
  float dt = timer.getDeltaSeconds();

  // Add particle
  if (mousePressed)
    particles.add(new Particle(mouseX,mouseY,random(rMin,rMax)));

  // Update particles
  for (int i = 0; i < particles.size(); i++) 
  {
    Particle p = (Particle) particles.get(i);
    p.update(0);
  }

  // Box2D step
  box2d.step();

  // Drawing
  background(255);
  noStroke();
  int pixel;
  for (int i = 0; i < particles.size(); i++) 
  {
    Particle p = (Particle) particles.get(i);
    pixel = img.get(constrain((int)p.getPos().x,0,width), constrain((int)p.getPos().y,0,height));
    fill(pixel);
    p.display();
  }
 
 /* 
  noStroke();
  fill(0);
  bottomWall.display();
*/
}

// ------------------------------------
// keyPressed
void keyPressed()
{
  if (key == 's')
    saveFrame();
}

// ------------------------------------
// controlEvent
void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().id()) 
  {
    case(0):
      box2d.setGravity(0,(float) theEvent.controller().value());
    break;
  }
}

