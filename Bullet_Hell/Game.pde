void game() {
  objects.add(0, new Star());
  fill(0, 10);
  rect(width/2, height/2, width, height);
  
  int i = 0;
  while (i < objects.size()) {
    GameObject s = objects.get(i);
    s.act();
    s.show();
    if (s.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  
  st++;
  
  if (st > 260) enter = true;
  
  if (enter == true) {
  }
  
  if (shield == true) {
    fill(blue);
    circle(Starfighter.x, Starfighter.y, 70);
    energy--;
  }
  
  fill(white);
  textSize(30);
  text(energy, 100, 100);
}

void gameClicks() {
  mode = pause;
}
