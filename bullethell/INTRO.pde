void intro() {
  background(blue);
  
  //introgif display
  image(introGif[frameCount%50],0,0,width,height);
 
  //texts
  fill(lightGray);
  textFont(AVA);
  textSize(145);
  text("Bullet Hell",width/8,height/4);
  textSize(24);
  fill(white);
  text("Click to play",width/8,height*2/3);
  
}

void introClick() {
  mode = GAME;
  reset();
}
