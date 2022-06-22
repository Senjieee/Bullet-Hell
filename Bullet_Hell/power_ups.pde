class PowerUp extends GameObject {  
  
  PowerUp() {
    super(px, py, 0, pvy, 30, white, 1);
  }
  
  void show() {
    fill(white);
    circle(x, y, size);
    fill(black);
    textSize(20);
    text("?", x, y);
  }
  
  void act() {
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Starfighter) {
        if (collidingWith(obj)) {
          lives = 0;
          p = random(0, 100);
          if (p >= 0 && p <= 25) Heart();
          if (p > 25 && p <= 50) rapid = true;
          if (p > 50 && p <= 75) pierce = true;
          if (p > 75 && p <= 100) Refill();
        }
      }
      i++;
    }
    if (offScreen()) lives = 0;
  }
}
