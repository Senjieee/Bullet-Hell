void game() {
  addObjects();
  gameEngine();
  
  fill(0, tt);
  rect(width/2, height/2, width, height);
  
  st++;
  
  if (st > 260) enter = true;
  
  if (enter == true) {
  }
  
  if (shield == true) {
    stroke(blue, 100);
    fill(blue2, 100);
    circle(Starfighter.x, Starfighter.y, 200);
    energy--;
  }
  noStroke();
  fill(grey2);
  rect(110, 770, 200, 20);
  rectMode(CORNER);
  fill(blue);
  rect(10, 760, eMeter, 20);
  stroke(silver);
  strokeWeight(3);
  line(10, 760, 210, 760);
  line(10, 760, 10, 780);
  line(210, 760, 210, 780);
  line(10, 780, 210, 780);
  fill(white);
  textSize(30);
  text(Starfighter.lives+"x", 40, 735);
  
  noStroke();
  
  if (Starfighter.lives > 0) {
    fill(heart1);
    rect(80, 725, 10, 5);
    rect(95, 725, 10, 5);
    rect(85, 730, 25, 5);
    rect(75, 730, 5, 10);
    rect(80, 735, 25, 10);
    rect(85, 745, 15, 5);
    rect(90, 750, 5, 5);
    rect(105, 735, 5, 5);
    fill(white);
    rect(80, 730, 5, 5);
  }
  if (Starfighter.lives > 1) {
    fill(heart2);
    rect(125, 725, 10, 5);
    rect(140, 725, 10, 5);
    rect(130, 730, 25, 5);
    rect(120, 730, 5, 10);
    rect(125, 735, 25, 10);
    rect(130, 745, 15, 5);
    rect(135, 750, 5, 5);
    rect(150, 735, 5, 5);
    fill(white);
    rect(125, 730, 5, 5);
  }
  if (Starfighter.lives > 2) {
    fill(heart3);
    rect(165, 725, 10, 5);
    rect(180, 725, 10, 5);
    rect(170, 730, 25, 5);
    rect(160, 730, 5, 10);
    rect(165, 735, 25, 10);
    rect(170, 745, 15, 5);
    rect(175, 750, 5, 5);
    rect(190, 735, 5, 5);
    fill(white);
    rect(165, 730, 5, 5);
  }
  rectMode(CENTER);
  
  if (Starfighter.lives < 1) {
    mode = gameOver;
    rapid = false;
    pierce = false;
  }
  
  if (rapid == true) {
    fill(white);
    textSize(20);
    if (pierce == false) text("Rapid Fire: " + rttt + "s", 690, 20);
    if (pierce == true) text("Rapid Fire: " + rttt + "s", 690, 50);
    Rapid();
    rt++;
  }
  if (rt > 1800) {
    rapid = false;
    rt = 0;
  }
  if (pierce == true) {
    fill(white);
    textSize(20);
    text("Piercing Bullets: " + pttt + "s", 650, 20);
    Piercing();
    pt++;
  }
  if (pt > 1800) {
    pierce = false;
    pt = 0;
  }
}

void addObjects() {
  objects.add(0, new Star());
  if (enter == true) {
    if (frameCount % 120 == 0) objects.add(0, new Enemy());
    if (frameCount % 360 == 0) objects.add(0, new Enemy2());
    if (frameCount % 360 == 0) objects.add(0, new Enemy3());
  }
}

void gameEngine() {
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

void gameClicks() {
  mode = pause;
}
