

void gameover() {
  fill(lightGray);
  textSize(99);
  if (score >= triumph) {
    background(gold);
    text("TRIUMPH!",width/4,height/2);
    image(trophy,width*0.7, height/2 - 50, 300, 300);
  }
  else {
    background(red);
    text("GAMEOVER",width/4,height/2);
  }
  
  textSize(24);
  fill(white);
  text("Score: " + score, width/4, height*0.6);
  
  //return to start
  text("Back to start",width/4,height*2/3);
  tactile(height*2/3);
  
  //credits
  fill(white);
  text("Credits", width/4, height*0.8);
  tactile(height*0.8);
}

void gameoverClick() {
  if (mouseX > width/4 - 10 && mouseX < width/4 + 390 && mouseY > height*2/3-22 && mouseY < height*2/3 + 22) {
    mode = INTRO;
  }
  if (mouseX > width/4 - 10 && mouseX < width/4 + 390 && mouseY > height*0.8-22 && mouseY < height*0.8 + 22) {
    mode = CREDIT;
    frameCount = 0;
  }
}

void tactile (float textY) {
  if (mouseX > width/4 - 10 && mouseX < width/4 + 390 && mouseY > textY-22 && mouseY < textY + 22) {
    noFill();
    stroke(gray);
    rect(width/4 - 10, textY-22, 400, 40);
  }
}
