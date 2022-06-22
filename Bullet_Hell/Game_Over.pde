void gameOver() {
  gameEngine();
  fill(0, 10);
  rect(width/2, height/2, width, height);
  fill(red);
  textSize(100);
  text("You Died", width/2, 300);
  if (flash == true) {
    textSize(20);
    text("<click to restart>", width/2, 700);
  }
}

void gameOverClicks() {
  starColor = 255;
  mode = intro;
  enter = false;
  energy = 1200;
  rechargeT = 0;
  tt = 100;
  st = 0;
  eMeter = 200;
  bl = 1;
  pvy = 3;
  pt = 0;
  rt = 0;
  Starfighter.x = width/2;
  Starfighter.y = 1200;
  Starfighter.vx = 0;
  Starfighter.vy = 0;
  Starfighter.lives = 3;
}
