class Star extends GameObject{
  
  Star() {
    x = random(0, width);
    y = random(0, height);
    vx = 0;
    vy = random(1, 5);
    size = vy;
    c = star;
    lives = 1;
  }
  
  void act() {
    super.act();
    if (y > height+size) {
      y = -size;
    }
  }

}
