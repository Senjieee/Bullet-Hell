class Enemy extends GameObject {
  
  Enemy() {
    super(random(width), -20, 0, 5, 40, yellow, 1);
  }
  
  void act() {
    super.act();
    
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)); {
          lives--;
          obj.lives = 0;
        }
      }
      i++;
    }
    if (offScreen()) lives = 0;
  }
}
