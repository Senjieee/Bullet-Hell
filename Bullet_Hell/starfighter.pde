class Starfighter extends GameObject{
  
  int cooldown, threshold;
  
  Starfighter() {
    super(width/2, 1200, 0, 0, 40, red, 3);
    threshold = 10;
    cooldown = threshold;
  }
  
  void act() {
    cooldown++;
    if (enter == true) {
      if (boost == false) {
        if (up == true) vy = -5;
        if (down == true) vy = 5;
        if (left == true) vx = -5;
        if (right == true) vx = 5;
        threshold = 10;
      } else if (boost == true) {
        energy = energy - 2;
        if (up == true) vy = -10;
        if (down == true) vy = 10;
        if (left == true) vx = -10;
        if (right == true) vx = 10;
        threshold = 5;
      }
    
      if (!up && !down) vy = vy * 0.9;
      if (!left && !right) vx = vx * 0.9;
      
      if (shoot == true && cooldown >= threshold) {
        objects.add(new Bullet());
        cooldown = 0;
        if (boost == false) energy--;
        if (boost == true) energy = energy - 2;
      }
      
      if (x > width) {
        x = width;
      }
      if (x < 0) {
        x = 0;
      }
      if (y > height) {
        y = height;
      }
      if (y < 0) {
        y = 0;
      }
    }
    
    super.act();
    
    if(enter == false) vy = -2;
    
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);
      if (obj instanceof EnemyBullet) {
        if (collidingWith(obj) && shield == false) {
          lives--;
          obj.lives--;
        }
        if (shield == true) {
          if (dist(obj.x, obj.y, x, y) < obj.size/2 + 100) {
            obj.lives--;
            energy = energy - 30;
          }
        }
      }
      i++;
    }
  }
  
  void show() {
    fill(silver);
    triangle (x, y, x + 70, y + 20, x, y + 20);
    triangle (x, y, x - 70, y + 20, x, y + 20);
    fill(blue2);
    ellipse (x, y + 2, 30, 100);
    ellipse(x - 67, y + 22, 5, 40);
    ellipse(x + 67, y + 22, 5, 40);
    fill(c);
    ellipse (x, y, 30, 100);
    fill(blue3);
    ellipse(x, y - 15, 10, 30);
    fill(yellow);
    ellipse(x - 67, y + 20, 5, 40);
    ellipse(x + 67, y + 20, 5, 40);
  }
}
