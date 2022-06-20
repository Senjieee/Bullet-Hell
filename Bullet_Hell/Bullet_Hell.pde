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

boolean left, right, up, down, shoot, boost;
boolean flash;
boolean enter;

Star[] stars;
Bullet[] bullets;
int nStars;
int iflash;
int st;

ArrayList<GameObject> objects;
Starfighter Starfighter;
 
void setup() {
  size(800, 800);
  mode = intro;
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  noStroke();
  enter = false;
  
  objects = new ArrayList<GameObject>();
  Starfighter = new Starfighter();
  objects.add(Starfighter);
  
  iflash = 0;
  
  int starColor = 255;
  star = color(starColor, starColor, starColor);
  
  doom = createFont("DooM.ttf", 200);
  textFont(doom);
  
  nStars = 200;
  stars = new Star[nStars];
  int i = 0;
  while (i < nStars) {
    stars[i] = new Star();
    i++;
  
  background(0);
  }
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
}
