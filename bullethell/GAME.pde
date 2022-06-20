void game() {
  background(black);
  
  if (speed) { //speeding up ====================================================
    player1.vy = -7;
    speedUP = speedUP - 1;
    image(speedBoost, (player1.x+player1.size/2)-20, player1.y+player1.size-10, 40, height);
  }
  if (speedUP <= 0) speed = false;
  if (speedUP < speedDuration) speedUP = speedUP + 0.1;
  //end of speeding up===========================================================
  //Power-up 2
  if (Powerup2Act > 0) {
    /*rest of Power-up 2's perks are found in class Starship*/
    Powerup2Act--;
  }
  //end of power-up 2 ===========================================================
  
  addObjects();
  gameEngine();
  overheader();
  gameDebug();
  
  if (player1.lives <= 0 || score >= triumph) mode = OVER;
  
} //end of the drawing part ======================================================

void addObjects() { //------------------------------------------------------------
  //adding the star into the stars list
  objects.add(0, new Star());
  
  //adding enemies
  //int bossSpawn = 1000;
  //if (frameCount < bossSpawn || frameCount > 2*bossSpawn) {
  if (frameCount % 70 == 0) objects.add(new Enemy1());
  if (frameCount % 100 == 0) objects.add(new Enemy3());
  //}
  if (frameCount % 30 == 0) objects.add(new Enemy2()); 
  //if (frameCount == bossSpawn) objects.add(new Boss());
}

void gameEngine() { //------------------------------------------------------------
  //get the stars to drop and die
  int i = 0;
  while (i < objects.size()) {
    GameObject s = objects.get(i);
    s.act();
    s.show();
    if (s.lives == 0) objects.remove(i);
    else i++;
  }  
}

void gameDebug() { //-------------------------------------------------------------
  //stat
  if (statCounter > 0) {
    fill(255);
    textSize(15);
    text("Framerate: " + frameRate,40,20);
    text("Star amount: " + objects.size(),40,40);
    text("X Coordinate: " + player1.x,40,60);
    text("Y Coordinate: " + player1.y,40,80);
    text("Lives: " + player1.lives,40,100);
    text("Time: " + hour() + ":" + minute() + ":" + second(), 40, 120);
    text("Score: " + score, 40, 140);  
    text("Speed: " + nfs(-(player1.vy*10+1)+2,0,1) + " Gm/hr", 40, 160);
  }  
}

void overheader() {
  fill(white);
  textSize(15);
  //score display ====================================
  text("Score: " + score, width/2,20);
  //box 
  fill(lightGray);
  stroke(white);
  rect(width/2,40,75,10,5);
  //bar
  fill(gold);
  noStroke();
  
  float progress = (float(score)/triumph)*75;
  rect(width/2,40,progress,10,5);
  //power up display =================================
  image(powerup,width/3,10,70,70);
  image(powerup2,width/3+90,10,70,70);
  //show the usage of the power-ups are time increase
  fill(lightGray);
  float Pup1Angle = (float(Powerup1Length - Powerup1Act) / Powerup1Length)*360;
  float Pup2Angle = (float(Powerup2Length - Powerup2Act) / Powerup2Length)*360;
  arc(width/3+35,45,70,70,0,radians(Pup1Angle)); //display power up 1
  arc(width/3+125,45,70,70,0,radians(Pup2Angle)); //display power up 2
  
  //keyboard directions ==============================
  fill(white);
  image(S,width*0.87,10,30,30);
  text("Game Statistics",width*0.87+40,25);
  image(Q,width*0.87,50,30,30);
  text("Speed Boost",width*0.87+40,65);
  
  //health bar =======================================
  text("Starship",width*0.6,20);
  //box 
  fill(lightGray);
  stroke(white);
  rect(width*0.6 + 80,20,300,10);
  text(player1.lives + " / " + fullHealth, width*0.8-30,40);
  //bar
  fill(lightGreen);
  noStroke();
  
  float howMuchHealth = ((1.0*player1.lives) / fullHealth)*300;
  rect(width*0.6 + 80,20,howMuchHealth,10);
  //speed bar ========================================
  fill(white);
  text("Speed-Up",width*0.6-15,70);
  //box 
  fill(lightGray);
  stroke(white);
  rect(width*0.6 + 80,70,300,10);
  
  //status
  if (int(speedUP) == speedDuration) text("Ready",width*0.8+20,90);
  else text("Charging",width*0.8+20,90);
  //bar
  fill(lightBlue);
  noStroke();  
  
  float howLongTillSpeed = ((1.0*speedUP) / speedDuration)*300;  
  rect(width*0.6 + 80,70,howLongTillSpeed,10);
}
//end of sub-functions ===========================================================

void gameClick() {
  mode = OVER;
}
