class Star {
  float x, y, vx, vy, size;
  
  Star() {
    x = random(0, width);
    y = random(0, height);
    vx = 0;
    vy = random(1, 5);
    size = vy;
  }
  
  void show() {
    fill (star);
    square(x, y, size);
  }
  
  void act() {
    y = y + vy;
    if (y > height+size) {
      y = -size;
    }
  }

}
