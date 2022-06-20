class Star extends GameObject{
 
  //constructors
  Star() {
    super(random(0,width), random(0,height/2), 0, 0, random(1,3), 1, myLaser);
    vy = size;
  }
  
  //behavior functions
  void act() {  
    super.act();
    if (y > height) lives = 0;
  }
  
  void show() {
    fill(white);
    square(x,y,size);
  }

}
