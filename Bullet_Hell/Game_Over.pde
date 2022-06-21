void gameOver() {
}

void gameOverClicks() {
  mode = intro;
  enter = false;
  energy = 1200;
  rechargeT = 0;
  tt = 100;
  eMeter = 200;
  Starfighter.x = width/2;
  Starfighter.y = 1200;
  Starfighter.lives = 3;
}
