class Starship extends GameObject{
 
  int cooldown, threshold;
  
  Starship() {
    super(width/2, height*0.75, 0, 0, 60, fullHealth, spaceship);
    //x,y,vx,vy,size,lives,display
    threshold = 15;
    cooldown = threshold;
  }
  
  void act() {
    super.act();
    super.collideBossLaser();
    //managing the gun ===================
    if (space && cooldown >= threshold) {
    //with power-up 1 ====================
      if (Powerup1Act > 0) { 
        //middle of the star ship is player1.x + player1.size/2 - 10
        objects.add(new Bullet(player1.x + player1.size/2 - 40, player1.y + player1.size/2)); 
        objects.add(new Bullet(player1.x + player1.size/2 + 20, player1.y + player1.size/2)); 
        cooldown = 8;
        Powerup1Act--;
      }    
    //regular ============================
      else {
        objects.add(new Bullet(player1.x + player1.size/2 - 10, player1.y)); //note the 10 here is half of size of bullet
        cooldown = 0;
      }
    }
    cooldown ++;
    
    //controlling the starship ===========
    //with power-up2
    if (Powerup2Act > 0) {
      if (up)    vy = -5;
      if (down)  vy = 5;
      if (left)  vx = -8;
      if (right) vx = 8;      
    }
    //regular
    else {
      if (up)    vy = -1;
      if (down)  vy = 3;
      if (left)  vx = -5;
      if (right) vx = 5;
    }
    //unchanging ones
    if (!up && !down)    vy = vy*0.9;
    if (!left && !right) vx = vx*0.9;
    //resetting  location  ===============
    if (x < -size) x = width+size/2;
    if (x > width+size) x = -size/2;
    if (y < height/10) y = y + 2;
    if (y > height) y = height-2*size;
      
    //Get shot ===========================
    int i = 0;
    while(i < objects.size()) {
      GameObject obj = objects.get(i); //takeout the "i"th object in the objects list
      //determine whether Bullet hit us
      if (obj instanceof EnemyBullet) { //if obj that we took out is of Bullet class
        if (collidingWith(obj)) { //check if the ship collides with enemy bullets
          lives = lives-1;
          obj.lives = 0; //removing the bullet that hit us
        } 
      }
      //determine whether we crash into something
      if (obj instanceof Enemy1 || obj instanceof Enemy2) {
        if (collidingWith(obj)) {
          obj.lives = 0;
          lives--;
          if (obj instanceof Enemy1) lives=lives-4;
        }
      }
      //determine if we hit a powerup
      if (obj instanceof Powerup1) {
        if (collidingWith(obj)) {
          obj.lives = 0;
          Powerup1Act = Powerup1Length;
        }
      }
      if (obj instanceof Powerup2) {
        if (collidingWith(obj)) {
          obj.lives = 0;
          Powerup2Act = Powerup2Length;
        }
      }      
      //=============================
      i++;
    }
    //end of get shot ===================
  } 

  
}
