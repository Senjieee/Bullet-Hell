class EnemyBullet extends GameObject {
  
  EnemyBullet(float x, float y, float vx, float vy) {
    super(x, y + 40, vx, vy, 10, yellow, 1);
  }  
}
