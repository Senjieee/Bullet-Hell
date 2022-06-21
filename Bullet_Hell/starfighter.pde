class Starfighter extends GameObject{
  
  int cooldown,  threshold;
  
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
      } else if (boost == true) {
        energy = energy - 2;
        if (up == true) vy = -8;
        if (down == true) vy = 8;
        if (left == true) vx = -8;
        if (right == true) vx = 8;
      }
    
      if (!up && !down) vy = vy * 0.9;
      if (!left && !right) vx = vx * 0.9;
      
      if (shoot == true && cooldown >= threshold) {
        objects.add(new Bullet());
        energy--;
        cooldown = 0;
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
  }
  
  void show() {
    fill(silver);
    triangle (x, y, x + 70, y + 20, x, y + 20);
    triangle (x, y, x - 70, y + 20, x, y + 20);
    fill(c);
    ellipse (x, y, 30, 100);
    fill(blue3);
    ellipse(x, y - 15, 10, 30);
    fill(yellow);
    ellipse(x - 65, y + 20, 5, 40);
    ellipse(x + 65, y + 20, 5, 40);
  }
}
