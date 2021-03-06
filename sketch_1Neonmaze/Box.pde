class Box {
  Body body;
  float w;
  float h;
  
  Box(float x_, float y_) {
    float x = x_;
    float y = y_;
    w = 15;
    h = 15;
    
    makeBody(new Vec2(x,y),w,h);
    
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
  
  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
  
  
void attract(float x,float y) {
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    worldTarget.subLocal(bodyVec);
    worldTarget.normalize();
    worldTarget.mulLocal((float) 50);
    body.applyForce(worldTarget, bodyVec);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(0,0,255);
    noStroke();
    rect(0,0,w,h);
    popMatrix();
    
    if ((pos.x>=528) && (pos.x<=553) && (pos.y>=546)){
    textFont(letra3);
    fill(0,255,0);
    text("Has ganado",30,400);
  }
  }
  
void makeBody(Vec2 center, float w_, float h_) {
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(center));
  body = box2d.createBody(bd);


PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1.5;
    fd.friction = 0.5;
    fd.restitution = 0.1;
    
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
  
}