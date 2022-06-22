
//enemy1 ==============================================================================
class Enemy1 extends GameObject {
  
  Enemy1() {
    super(random(30,width-30), -30, 0, 2, 100, 2, enemy1);
  }
  
  void act() {
    super.act();
    super.enemyShot(3);
    super.collideBossLaser();   
    
    //shoot
    if (frameCount%(int) random(50, 60) == 0) objects.add(new EnemyBullet(x+10, y+50, 0, 10));
    if (frameCount%(int) random(50, 60) == 0) objects.add(new EnemyBullet(x+80, y+50, 0, 10));
    
    //when crashing into things
    for (int a=0;a<objects.size();a++) {
      GameObject ene = objects.get(a);
      if (collidingWith(ene)) if (ene instanceof Enemy2) ene.lives = 0;
    }
    
    //remove if goes off screen
    if (offScreen()) lives = 0;
    if (lives == 0) {
      objects.add(new Flame(this)); //add explosion
      if ((int)random(4,8) == 6 && offScreen() == false) objects.add(new Powerup1(this.x+this.size/2, this.y+this.size/2)); //powerup
    }
  }
}

//enemy2 ==============================================================================
class Enemy2 extends GameObject {
  Enemy2(float X, float Y, float VX) {
    super(X, Y, VX, (int) random(3,5), 60, 1, enemy2);
    //x,y,vx,vy,size,lives,display
  }
  
  void act() {
    super.act();
    super.enemyShot(1);
    super.collideBossLaser();

    //shoot
    if (frameCount%(int) random(40, 50) == 0) objects.add(new EnemyBullet(x+17, y+15, 0, 10));

    if (offScreen()) lives = 0;
    if (lives == 0) objects.add(new Flame(this));
  }
}

//enemy 3 ============================================================================
class Enemy3 extends GameObject {
  float ax, ay;
  
  Enemy3() {
    super(0, player1.y, 0, 0, 70, 1, enemy3);
    //x,y,vx,vy,size,lives,display
    int determiner = (int) random(0,2);
    if (determiner == 0) {
      x = 0;
      display = enemy3;
      vx = 5;
    }
    if (determiner == 1) {
      x = width;
      display = enemy3b;
      vx = -5;
    }
  }
  
  void act() {
    super.act();
    super.enemyShot(5);
    super.collideBossLaser();
    //spawn =================================================
    //crash into everything
    for (int a=0;a<objects.size();a++) {
      GameObject ene = objects.get(a);
      if (ene instanceof Enemy1 || ene instanceof Enemy2 || ene instanceof Starship) {
        if (collidingWith(ene)) {
          if (ene instanceof Starship) ene.lives = ene.lives - 20;
          else ene.lives = 0;
          if (ene instanceof Enemy1|| ene instanceof Starship) lives = 0;
        }
      }
    }
    //remove if goes off screen
    if (offScreen()) lives = 0;
    if (lives == 0) {
      objects.add(new Flame(this));
      if ((int)random(1,5) == 2 && offScreen() == false) objects.add(new Powerup2(this.x+this.size/2, this.y+this.size/2)); //powerup
    }
  }
}

//boss ==============================================================================
class Boss extends GameObject {
  Boss() {
    super(width/2-140, -280, 0, 0.5, 280, 15, boss);
    //x,y,vx,vy,size,lives,display
  }
  
  void act() {
    super.enemyShot(50);
    x = x + vx;
    y = y + vy;
    //shoot
    if (frameCount % 200 == 0) { //laser
      objects.add(new BossLaser(x+size/2-7, y+size-100,0.5,height-this.y)); //down laser: the vy must be equal to that of the boss
      objects.add(new BossLaser(x+size/2-7, -30,0.5, y+70+30)); //up laser: i can't even underestand my own math by this point
    }
    if (frameCount%100== 0) { //the swarm ships
      objects.add(new Enemy2(x-60, y+size-150,-1)); //backleft
      objects.add(new Enemy2(x+size, y+size-150,1)); //backright
      objects.add(new Enemy2(x+size/2-90, y+size,0)); //frontleft
      objects.add(new Enemy2(x+size/2+30, y+size,0)); //frontright
    }

    //crash into everything
    for (int a=0;a<objects.size();a++) {
      GameObject ene = objects.get(a);
      if (ene instanceof Enemy1 || ene instanceof Enemy2 || ene instanceof Starship || ene instanceof Enemy3) {
        if (collidingWith(ene)) {
          ene.lives = 0;
        }
      }
    }

    if (offScreen()) lives = 0;
    if (lives == 0) objects.add(new Flame(this));
  }
}
