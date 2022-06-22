class Enemy extends GameObject {
  
  int cooldown, threshold;
  
  Enemy() {
    super(random(width), -20, 0, 5, 20, brown, 1);
    threshold = 60;
    cooldown = threshold;
  }
  
  void act() {
    cooldown++;
    super.act();
    
    if (cooldown >= threshold) {
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
            obj.lives = obj.lives - 2;
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
      if (p > 0 && p < 10) {
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
    fill(red2);
    ellipse(x - 50, y - 15, 10, 40);
    ellipse(x + 50, y - 15, 10, 40);
    fill(grey3);
    triangle (x, y + 30, x + 70, y - 20, x, y - 20);
    triangle (x, y + 30, x - 70, y - 20, x, y - 20);
    stroke(black);
    line(x + 10, y + 18, x + 58, y - 17);
    line(x - 10, y + 18, x - 58, y - 17);
    noStroke();
    fill(c);
    ellipse (x, y, 30, 100);
    fill(green2);
    ellipse(x, y - 15, 10, 30);
  }
}
