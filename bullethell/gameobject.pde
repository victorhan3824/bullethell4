abstract class GameObject {

  //instance
  float x, y, vx, vy, size;
  int lives;
  PImage display;

  GameObject(float X, float Y, float VX, float VY, float SIZE, int LIVES, PImage DISPLAY) {
    this.x       = X;
    this.y       = Y;
    this.vx      = VX;
    this.vy      = VY;
    this.size    = SIZE;
    this.lives   = LIVES;
    this.display = DISPLAY;
  }

  void act() {
    x += vx;
    y += vy;
  }
  
  void enemyShot(int n) {
  //enemy get shot
    int i = 0;
    while(i < objects.size()) {
      GameObject obj = objects.get(i); //takeout the "i"th object in the objects list
      if (obj instanceof Bullet) { //if obj that we took out is of Bullet class
        if (collidingWith(obj)) {
          lives--;
          obj.lives = 0; //removing the bullet that we shot the enemy with
          if (lives == 0) score = score + n; //adding points
        } 
      }
      i++;
    }    
  }

  void show() {
    if (this.size == 300 || this.size == 70) image(display, x, y, size*1.69, size); 
    else image(display, x, y, size, size);
  }
  
  void rectShow() {
    image(display, x, y, size*1.69, size);    
  }
  
  boolean collidingWith(GameObject object) { //used in enemy classes
    return (dist(object.x+object.size/2, object.y+object.size/2, x+size/2, y+size/2) < object.size/2 + size/2);
    /*Note 1: when this function is used in Class Enemy1, the object.[something] are variables for the bullet,
    the [something] variables are the variables of enemy1 */
  }
  
  boolean offScreen() {
    return (x < 0 || x > width || y < -50 || y > height);
  }
  
}
