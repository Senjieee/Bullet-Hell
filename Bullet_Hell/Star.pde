class Star extends GameObject{
  
  Star() {
    super(random(0, width), random(0, height), 0, 0, random(1, 5), white, 1);
    vy = size;
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
    if (y > height) lives = 0;
  }

}
