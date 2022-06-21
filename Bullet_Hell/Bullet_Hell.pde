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
color heart1;
color heart2;
color heart3;

int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;

boolean left, right, up, down, shoot, boost, shield;
boolean flash;
boolean enter;

float energy, eMeter;

int iflash;
int st;
int rechargeT;
int tt;

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
  eMeter = 200;
  
  objects = new ArrayList<GameObject>();
  Starfighter = new Starfighter();
  
  iflash = 0;
  
  int starColor = 255;
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
  
  if (Starfighter.lives > 6) Starfighter.lives = 6;
  
  if (Starfighter.lives > 3) heart1 = color(yellow);
  if (Starfighter.lives > 4) heart2 = color(yellow);
  if (Starfighter.lives > 5) heart3 = color(yellow);
}
