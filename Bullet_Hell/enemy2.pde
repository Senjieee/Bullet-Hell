class Enemy2 extends GameObject {
  
  int cooldown, threshold;
  
  Enemy2() {
    super(random(width), -20, 0, 10, 20, white, 1);
    threshold = 60;
    cooldown = threshold;
  }
  
  void act() {
    cooldown++;
    super.act();
    
    if (cooldown >= threshold) {
      objects.add(new EnemyBullet(x, y, 10, 10));
      objects.add(new EnemyBullet(x, y, -10, 10));
      objects.add(new EnemyBullet(x, y, 10, -10));
      objects.add(new EnemyBullet(x, y, -10, -10));
      cooldown = 0;
    }
    
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;
          obj.lives--;
        }
      }
      if (obj instanceof Starfighter) {
        if (shield == false) {
          if (collidingWith(obj)) {
            lives = 0;
            obj.lives--;
        }
        } else if (shield == true) {
          if (dist(obj.x, obj.y, x, y) < 100 + size/2) {
            lives = 0;
            energy = energy - 120;
          }
        }
        }
      i++;
    }
    if (offScreen()) lives = 0;
    
    if (lives == 0) {
      p = random(0, 100);
      if (p > 0 && p < 30) {
        px = x;
        py = y;
        objects.add(new PowerUp());
      }
    }
  }
}
