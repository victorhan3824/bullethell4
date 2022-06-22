
//mode credit =============================================================
void credit() {
  background(black);
  fill(silver);
  textSize(69);
  text("Bullet Hell - Closing Credits", 100, 100); //game title
  
  //credit message --------------------------------------------------------
  textSize(18);
  //to be finished tomorrow
  
}

void creditClick() {
  mode = INTRO;  
}

//ultilities ==============================================================
void reset() {
  //class initalization input
  objects = new ArrayList<GameObject>();
  player1 = new Starship();
  objects.add(player1);
  frameCount = 0;
  //misc
  statCounter = 1;
  speedUP = speedDuration;
  score = 0;
  bossLaserOn = false;
  //power-ups
  Powerup1Act = 0;
  Powerup2Act = 0;
}

//keyboard ================================================================

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true ;
  if (key == ' ') space = true;
  if (key == 's' || key == 'S') stat = true;
  if (speedUP >= speedDuration) if (key == 'q' || key == 'Q') speed = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (key == ' ') space = false;
  if (key == 's' || key == 'S') statCounter = statCounter*-1;
}
