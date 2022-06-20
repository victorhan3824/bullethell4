/*
   ::::::..      ::::::  ::    ::  ::::::
 ::: :::::::     ::      ::    ::  ::
 :::       ::    ::::::  ::    ::  ::::::
 ::: :::::::         ::  ::.  .::      ::
 :::.....::      ::::::    ::::    ::::::
 :::.....::
 :::     ::                                 
 */

//color pallette =======================================================
color white      = #FFFFFF; 
color red        = #FF0000;
color pink       = #FF6ABC;
color lightBlue  = #00FCEE;
color brown      = #9F642C;
color blue       = #324BE3;
color gray       = #818183;
color lightGreen = #00FF00;
color medGreen   = #006C27;
color yellow     = #F6FF05;
color orange     = #FF7E05;
color darkBrown  = #341F18; 
color black      = #000000;      
color lightGray  = #939393;

color bronze     = #DE7300;
color silver     = #D1D1D1;
color gold       = #E5C982;

// variables ==================================================
final int INTRO = 0;
final int GAME  = 1; 
final int OVER  = 2;
final int PAUSE = 3;
int mode, triumph; 

//class initialization
ArrayList<GameObject> objects;
Starship player1;
int fullHealth;

//keyboard variable
boolean up, down, left, right, space;
boolean stat, speed;

//misc variables
PFont AVA;
PImage spaceship, myLaser;
PImage enemy1, enemyBullet, enemy2, enemy3, enemy3b, boss;
PImage powerup, powerup2;
int statCounter, score, speedDuration;
float speedUP;
PImage Q, S, speedBoost;

//intro gif stuff
PImage[] introGif;
int frameNum;
//explosion
PImage[] explosion;

//powerup variables
int Powerup1Act, Powerup1Length, Powerup2Act, Powerup2Length;

//setup, draw, mouse ===================================================
void setup() {
  fullScreen();  
  mode = INTRO; 
  textAlign(CORNER, CENTER);
  fullHealth = 10000;
  speedDuration = 30;
  triumph = 200;
  Powerup1Length = 60;
  Powerup2Length = 500; 
  
  //intro gif stuff
  frameNum = 50;
  introGif = new PImage[frameNum];
  int i = 0;
  for (int a=0; a < 5; a++) {
    for (int b=0; b < 10; b++) {
      introGif[i] = loadImage("introGif/frame_0"+a+b+"_delay-0.04s.gif");
      i++;
    }
  }
  //explosion
  explosion = new PImage[12];
  for (int a=0;a<12;a++) explosion[a] = loadImage("explosion/frame_"+a+"_delay-0.1s.gif");
  
  //text, fonts, images
  AVA = createFont("AVA.ttf", 169);
  Q = loadImage("Q.png");
  S = loadImage("S.png");
  speedBoost = loadImage("speed.png");
      //player ship
  spaceship = loadImage("spaceship.png");
  myLaser = loadImage("myLaser.png");
      //Non-player entities  
  enemy1 = loadImage("enemy1.png");
  enemy2 = loadImage("enemy2.png");
  enemy3 = loadImage("enemy3.png");
  enemy3b = loadImage("enemy3b.png");
  enemyBullet = loadImage("enemy1Laser.png");
  boss = loadImage("boss.png");
  powerup = loadImage("powerup.png");
  powerup2 = loadImage("powerup2.png");
  reset();
}

void draw() {
  if (mode == INTRO)        intro();
  else if (mode == GAME)     game();
  else if (mode == OVER) gameover();
}

void mouseClicked() {
  if (mode == INTRO)        introClick();
  else if (mode == GAME)     gameClick();
  else if (mode == OVER) gameoverClick();
}
