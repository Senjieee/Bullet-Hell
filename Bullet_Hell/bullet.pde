class Bullet extends GameObject {
  Bullet() {
    super(Starfighter.x, Starfighter.y - 30, 0, -10, 10, orange2, bl);
  }
  
  void act() {
    super.act();
    if (offScreen()) lives = 0;
    
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives--;
        }
      }
      i++;
    }
  }
}
