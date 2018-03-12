Mover m;

class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //velocity.limit(5);
    acceleration.mult(0);
  }
  
  void edge() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
    
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }
  }
  
  void create() {
    noStroke();
    fill(0);
    ellipse(location.x, location.y, 40, 40);
  }
  
}

void setup() {
  pixelDensity(displayDensity());
  size(800,600);
  background(255);
  smooth();
  //frameRate(60);
  m = new Mover();
}

void draw() {
  background(255);
  
  PVector gravity = new PVector(0,0.1);
  m.applyForce(gravity);
  
  PVector wind = new PVector(0.2,0);
  m.applyForce(wind);
  
  m.create();
  m.update();
  m.edge();
  
}