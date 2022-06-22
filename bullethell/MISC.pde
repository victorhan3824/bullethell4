
//mode credit =============================================================
void credit() {
  background(black);
  fill(silver);
  textSize(69);
  text("Bullet Hell - Closing Credits", 100, 100); //game title
  
  //credit message --------------------------------------------------------
  textSize(18);
  creditMessage("Technical Support","- P. Shafeazadeh",1);
  creditMessage("Inspiration","- H. Ouyang",2);
  creditMessage("Naming Variables","- M. Dodek", 3);
  creditMessage("Graphics","- V. Han", 4);
  creditMessage("Game Design","- V. Han", 5);
  creditMessage("Logician","- V. Han", 6);
  creditMessage("Code Organization","- K. So", 7);
  creditMessage("Game Framework","- V. Han", 8);
  creditMessage("Technical Guidence","- L. Pelletier", 9);
}

void creditClick() {
  mode = INTRO;  
}

void creditMessage(String title, String name, int rowNum) {
  //rowNum determine which row does the text goes into
  textSize(18);
  if (frameCount > rowNum*50) {
    text(title,100,rowNum*40+200);
    text(name, 500,rowNum*40+200);
  }
}

//mode credits over =======================================================
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
