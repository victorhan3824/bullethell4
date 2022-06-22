class Bullet extends GameObject{  
  
  Bullet(float a, float b) {
    super(a, b, 0, -10, 20, 1, myLaser);
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

class BossLaser extends GameObject {
  
  int n;
  BossLaser(float x, float y, float vy, float size) {
    super(x,y,0,vy,size,1,bossLaser);  
    n = 0;
  }
  
  void act() {
    super.act();
    n++;
    if (n > 100) {
      lives = 0;
      n = 0;
    }
    if (y > height) lives = 0;
    
    if (lives > 0) bossLaserOn = true;
    else bossLaserOn = false;
  }
  
  void show() {
    image(bossLaser,x,y,14,size);  
  }
  
}
