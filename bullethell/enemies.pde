
//enemy1 ==============================================================================
class Enemy1 extends GameObject {
  
  Enemy1() {
    super(random(30,width-30), -30, 0, 2, 100, 2, enemy1);
  }
  
  void act() {
    super.act();
    super.enemyShot(3);
    
    //shoot
    if (frameCount%(int) random(50, 60) == 0) objects.add(new EnemyBullet(x+10, y+50, 0, 10));
    if (frameCount%(int) random(50, 60) == 0) objects.add(new EnemyBullet(x+80, y+50, 0, 10));
    
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
  Enemy2() {
    super(random(20,width-20), -15, (int) random(-5,5), (int) random(3,5), 60, 1, enemy2);
    //x,y,vx,vy,size,lives,display
  }
  
  void act() {
    super.act();
    super.enemyShot(1);

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
    super(0, (int) random(0,height/3), 0.5, 0.2, 300, 5, boss);
    //x,y,vx,vy,size,lives,display
  }
  
  void act() {
    super.enemyShot(200);
    
    x = x + vx;
    y = y + vy;
    ////shoot
    //if (frameCount%(int) random(40, 50) == 0) objects.add(new EnemyBullet(x+17, y+15, 0, 10));

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
