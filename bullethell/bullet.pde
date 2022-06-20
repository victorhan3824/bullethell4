class Bullet extends GameObject{  
  
  Bullet(float a) {
    super(a, player1.y, 0, -10, 20, 1, myLaser);
  }
  
  void act() {
    super.act();
    if (x < 0 || x > width || y < 0 || y > height) lives = 0;

  }
  
}

class EnemyBullet extends GameObject {
  
  EnemyBullet(float x, float y, float vx, float vy) {
    super(x, y, vx, vy, 10, 1, enemyBullet);
    vy = y/200;
  }
  
  void act() {
    super.act();
    if (y > height) lives = 0;
  }
 
}
