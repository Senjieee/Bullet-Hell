class Enemy3 extends GameObject {
  
  int cooldown, threshold;
  boolean shield;
  
  Enemy3() {
    super(random(width), -20, 0, 3, 40, grey3, 3);
    threshold = 60;
    cooldown = threshold;
  }
  
  void act() {
    cooldown++;
    super.act();
    
    if (cooldown >= threshold) {
      objects.add(new EnemyBullet(x, y, 10, 0));
      objects.add(new EnemyBullet(x, y, -10, 0));
      objects.add(new EnemyBullet(x, y, 0, -10));
      objects.add(new EnemyBullet(x, y, 0, 10));
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
          eLimit = 30;
          ex = x;
          ey = y;
          objects.add(new Explosion());
        }
      }
      if (obj instanceof Starfighter) {
        if (shield == false) {
          if (collidingWith(obj)) {
            lives = 0;
            obj.lives = obj.lives - 2;
        }
        } else if (shield == true) {
          if (dist(obj.x, obj.y, x, y) < 100 + size/2) {
            lives = 0;
            energy = energy - 360;
          }
        }
        }
      i++;
    }
    if (offScreen()) lives = 0;
    
    if (lives == 0) {
      explosion = color(orange2);
      eLimit = 100;
      ex = x;
      ey = y;
      objects.add(new Explosion());
    }
    
    if (lives == 0) {
      p = random(0, 100);
      if (p > 0 && p < 40) {
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
    fill(c);
    circle(x, y, size);
    if (lives > 1) {
      shield = true;
      stroke(red2);
      fill(red, 100);
      circle(x, y, 50);
      noStroke();
    }
  }
}
