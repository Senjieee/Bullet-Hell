class Starfighter extends GameObject{
  
  Starfighter() {
    x = width/2;
    y = 1200;
    vx = 0;
    vy = 0;
    size = 40;
    c = red;
    lives = 3;
  }
  
  void act() {
    if (enter == true) {
      if (up == true) vy = -5;
      if (down == true) vy = 5;
      if (left == true) vx = -5;
      if (right == true) vx = 5;
      if (shoot == true) objects.add(new Bullet());
    
      if (!up && !down) vy = vy * 0.9;
      if (!left && !right) vx = vx * 0.9;
      
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
}
