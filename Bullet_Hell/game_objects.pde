abstract class GameObject {
  float x, y, vx, vy, size;
  color c;
  int lives;
  
  GameObject() {
  }
  
  void act() {
    x += vx;
    y += vy;
  }
  
  void show() {
    fill (c);
    square(x, y, size);
  }
}
