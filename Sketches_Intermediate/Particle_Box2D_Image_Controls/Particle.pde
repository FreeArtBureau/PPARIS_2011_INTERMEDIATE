class Particle {

  // We need to keep track of a Body
  Body body;
  float radius;
  float life,lifeMax;

  // Constructor
  Particle(float x_, float y_, float radius) {
    float x = x_;
    float y = y_;
    this.radius = radius;
    this.lifeMax = random(3,10);
    this.life = 0;

    // Add the box to the box2d world
    // Here's a little trick, let's make a tiny tiny radius
    // This way we have collisions, but they don't overwhelm the system
    makeBody(new Vec2(x,y),radius);
  }
  

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }
  
  Vec2 getPos()
  {
    return box2d.getScreenPos(body);
  }

  void update(float dt)
  {
    life += dt;   
  }

  boolean dead()
  {
    return (life>=lifeMax);
  }


  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = getPos();

    pushMatrix();
    translate(pos.x,pos.y);
    ellipse(0,0,this.radius*2,this.radius*2);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float r) {
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.screenToWorld(center));
    body = box2d.createBody(bd);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-1,1),random(-1,1)));

    // We'll make the shape a circle I guess (though we could have done rectangle, maybe faster?)
    CircleDef cd = new CircleDef();
    r = box2d.scaleScreenToWorld(r);
    cd.radius = r;

    // Parameters that affect physics
    cd.density = 0.1f;
    cd.friction = 0.0f;    // Slippery when wet!
    cd.restitution = 0.5f;

    // We could use this if we want to turn collisions off
    //cd.filter.groupIndex = -10;

    // Attach that shape to our body!
    body.createShape(cd);
    body.setMassFromShapes();

  }

}


