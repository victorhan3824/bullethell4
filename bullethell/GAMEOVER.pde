void gameover() {
  if (player1.lives <= 0) background(red);
  else background(blue);
  
  //text
  fill(lightGray);
  textSize(99);
  if (player1.lives > 0) text("TRIUMPH!",width/4,height/2);
  else text("GAMEOVER",width/4,height/2);
  
  textSize(24);
  fill(white);
  text("Score: " + score, width/4, height*0.6);
  text("Back to start",width/4,height*2/3);
}

void gameoverClick() {
  mode = INTRO;
  
}
