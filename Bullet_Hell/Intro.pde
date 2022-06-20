void intro() {
  colorMode(RGB);
  
  textSize(20);
  text("welcome to", width/2, 260);
  textSize(80);
  text("Bullet Hell", width/2, 300);
  
  if (flash == true) {
    textSize(20);
    text("<click to start>", width/2, 700);
  }
  
  objects.add(new Star());
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
}

void introClicks() {
  mode = game;
  objects.add(Starfighter);
}
