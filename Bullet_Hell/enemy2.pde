class Enemy2 extends GameObject {
  
  int cooldown, threshold;
  
  Enemy2() {
    super(random(width), -20, 0, 10, 20, silver, 1);
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
          explosion = color(orange2);
          eLimit = 100;
          ex = x;
          ey = y;
          objects.add(new Explosion());
        }
      }
      if (obj instanceof Starfighter) {
        if (shield == false) {
          if (collidingWith(obj)) {
            lives = 0;
            obj.lives--;
            explosion = color(orange2);
            eLimit = 100;
            ex = x;
            ey = y;
            objects.add(new Explosion());
        }
        } else if (shield == true) {
          if (dist(obj.x, obj.y, x, y) < 100 + size/2) {
            lives = 0;
            energy = energy - 120;
            explosion = color(orange2);
            eLimit = 100;
            ex = x;
            ey = y;
            objects.add(new Explosion());
          }
        }
        }
      i++;
    }
    if (offScreen()) lives = 0;
    
    if (lives == 0) {
      p = random(0, 100);
      if (p > 0 && p < 30) {
        explosion = color(white);
        eLimit = 30;
        ex = x;
        ey = y;
        objects.add(new Explosion());
        px = x;
        py = y;
        objects.add(new PowerUp());
      }
    }
  }
  
  void show() {
    fill(yellow);
    rect(x, y, 100, 20);
    fill(c);
    ellipse(x, y, size, 100);
    fill(black);
    rect(x, y, 3, 50);
  }
}
