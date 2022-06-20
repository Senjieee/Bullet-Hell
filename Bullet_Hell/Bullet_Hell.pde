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

int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;

boolean left, right, up, down, shoot, boost, shield;
boolean flash;
boolean enter;

float energy;

int iflash;
int st;
int rechargeT;

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
  energy = 600;
  rechargeT = 0;
  
  objects = new ArrayList<GameObject>();
  Starfighter = new Starfighter();
  
  iflash = 0;
  
  int starColor = 255;
  star = color(starColor, starColor, starColor);
  
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
  
  rechargeT--;
  if (rechargeT < 0) rechargeT = 0;
  if (energy > 600) energy = 600;
  if (energy < 0) {
    energy = 0;
    rechargeT = 180;
    boost = false;
    shoot = false;
    shield = false;
  }
  
  if (boost == false && shield == false && shoot == false && rechargeT == 0) {
    energy++;
  }
}
