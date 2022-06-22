class Explosion extends GameObject {
  
  Explosion() {
    super(ex, ey, 0, 0, eSize, explosion, 1);
  }
  
  void show() {
    stroke(c);
    noFill();
    circle(x, y, size);
    noStroke();
  }
  
  void act() {
    size = size + 3;
    if (size >= eLimit) {
      size = 0;
      lives = 0;
    }
    if (offScreen()) lives = 0;
  }
}
