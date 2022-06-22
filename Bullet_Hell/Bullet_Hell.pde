//Johnny Geng
//2-3
//June 17 2022  
//Bullet Hell

PFont doom;

color star; 

color red = color(255, 0, 0);
color blue = color(24, 0, 255);
color yellow = color(255, 247, 0);
color green = color(0, 255, 44);
color orange = color(255, 132, 0);
color purple = color(195, 0, 255);
color grey = color(59, 53, 54);
color black = color(0);
color white = color(255);
color silver = #C0C0C0;
color grey2 = #404040;
color blue2 = color(36, 173, 255);
color blue3 = color(172, 224, 247);
color brown = color(72, 15, 15);
color grey3 = color(108, 97, 97);
color green2 = color(89, 118, 73);
color red2 = color(155, 9, 14);
color orange2 = color(255, 196, 0);
color heart1;
color heart2;
color heart3;
color explosion;

int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;

boolean left, right, up, down, shoot, boost, shield;
boolean flash;
boolean enter;
boolean health, rapid, pierce, refill;

float energy, eMeter;
float p;
float ex, ey, eSize, eLimit;

int iflash;
int st;
int rechargeT;
int tt;
int bl;
int pttt, rttt;
int starColor;
float px, py, pvy;
float pt, rt;
float ptt, rtt;

ArrayList<GameObject> objects;
Starfighter Starfighter;
 
void setup() {
  size(800, 800);
  mode = intro;
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  noStroke();
  enter = false;
  shield = false;
  energy = 1200;
  rechargeT = 0;
  tt = 100;
  st = 0;
  eMeter = 200;
  bl = 1;
  pvy = 3;
  py = py + pvy;
  pt = 0;
  rt = 0;
  eSize = 0;
  
  objects = new ArrayList<GameObject>();
  Starfighter = new Starfighter();
  
  iflash = 0;
  
  explosion = color(orange2);
  starColor = 255;
  star = color(starColor, starColor, starColor);
  heart1 = color(red);
  heart2 = color(red);
  heart3 = color(red);
  
  doom = createFont("DooM.ttf", 200);
  textFont(doom);
}

void draw() {
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == pause) {
    pause();
  } else if (mode == gameOver) {
    gameOver();
  } else {
    println("Error: Mode = " + mode);
  }
  
  iflash++;
  
  if (iflash > 70) {
    flash = true;
  } else if (iflash < 70) {
    flash = false;
  }
  
  if (iflash > 90) {
    iflash = 0;
  }
  
  if (tt > 100) tt = 100;
  if (boost == true) tt = 10;
  else if (boost == false) tt++;
  
  if (mode == game) {
    rechargeT--;
  }
  if (rechargeT < 0) rechargeT = 0;
  if (energy > 1200) energy = 1200;
  if (energy < 0) {
    energy = 0;
    rechargeT = 180;
    boost = false;
    shoot = false;
    shield = false;
  }
  
  if (shield == true) {
    boost = false;
    shoot = false;
  }
  
  if (boost == false && shield == false && shoot == false && rechargeT == 0 && mode == game) {
    energy++;
  }
  
  eMeter = map(energy, 1200, 0, 200, 0);
  
  ptt = map(pt, 1800, 0, 0, 30);
  rtt = map(rt, 1800, 0, 0, 30);
  
  if (Starfighter.lives > 6) Starfighter.lives = 6;
  
  if (Starfighter.lives > 3) {
    heart1 = color(yellow);
  } else {
    heart1 = color(red);
  }
  if (Starfighter.lives > 4) {
    heart2 = color(yellow);
  } else {
    heart2 = color(red);
  }
  if (Starfighter.lives > 5) {
    heart3 = color(yellow);
  } else {
    heart3 = color(red);
  }
  
  if (ptt == 30) pttt = 30;
  if (ptt == 29) pttt = 29;
  if (ptt == 28) pttt = 28;
  if (ptt == 27) pttt = 27;
  if (ptt == 26) pttt = 26;
  if (ptt == 25) pttt = 25;
  if (ptt == 24) pttt = 24;
  if (ptt == 23) pttt = 23;
  if (ptt == 22) pttt = 22;
  if (ptt == 21) pttt = 21;
  if (ptt == 20) pttt = 20;
  if (ptt == 19) pttt = 19;
  if (ptt == 18) pttt = 18;
  if (ptt == 17) pttt = 17;
  if (ptt == 16) pttt = 16;
  if (ptt == 15) pttt = 15;
  if (ptt == 14) pttt = 14;
  if (ptt == 13) pttt = 13;
  if (ptt == 12) pttt = 12;
  if (ptt == 11) pttt = 11;
  if (ptt == 10) pttt = 10;
  if (ptt == 9) pttt = 9;
  if (ptt == 8) pttt = 8;
  if (ptt == 7) pttt = 7;
  if (ptt == 6) pttt = 6;
  if (ptt == 5) pttt = 5;
  if (ptt == 4) pttt = 4;
  if (ptt == 3) pttt = 3;
  if (ptt == 2) pttt = 2;
  if (ptt == 1) pttt = 1;
  if (ptt == 0) pttt = 0;
  
  if (rtt == 30) rttt = 30;
  if (rtt == 29) rttt = 29;
  if (rtt == 28) rttt = 28;
  if (rtt == 27) rttt = 27;
  if (rtt == 26) rttt = 26;
  if (rtt == 25) rttt = 25;
  if (rtt == 24) rttt = 24;
  if (rtt == 23) rttt = 23;
  if (rtt == 22) rttt = 22;
  if (rtt == 21) rttt = 21;
  if (rtt == 20) rttt = 20;
  if (rtt == 19) rttt = 19;
  if (rtt == 18) rttt = 18;
  if (rtt == 17) rttt = 17;
  if (rtt == 16) rttt = 16;
  if (rtt == 15) rttt = 15;
  if (rtt == 14) rttt = 14;
  if (rtt == 13) rttt = 13;
  if (rtt == 12) rttt = 12;
  if (rtt == 11) rttt = 11;
  if (rtt == 10) rttt = 10;
  if (rtt == 9) rttt = 9;
  if (rtt == 8) rttt = 8;
  if (rtt == 7) rttt = 7;
  if (rtt == 6) rttt = 6;
  if (rtt == 5) rttt = 5;
  if (rtt == 4) rttt = 4;
  if (rtt == 3) rttt = 3;
  if (rtt == 2) rttt = 2;
  if (rtt == 1) rttt = 1;
  if (rtt == 0) rttt = 0;
}

void Heart() {
  Starfighter.lives = Starfighter.lives + 1;
}

void Rapid() {
  Starfighter.threshold = 1;
}

void Piercing() {
  bl = 5;
}

void Refill() {
  energy = energy + 600;
}
