void game() {
  fill(0, 10);
  rect(width/2, height/2, width, height);
  int i = 0;
  while (i < nStars) {
    stars[i].show();
    stars[i].act();
    i++;
  }
}

void gameClicks() {
  mode = pause;
}
