class Bullet extends GameObject {
  Bullet() {
    x = Starfighter.x;
    y = Starfighter.y;
    vx = 0;
    vy = -10;
    size = 5;
    c = red;
    lives = 1;
  }
  
  void act() {
    super.act();
    if (x < 0 || x > width || y < 0 || y > height) lives = 0;
  }
}
