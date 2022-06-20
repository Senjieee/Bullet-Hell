void keyPressed() {
  if (key == 'a' || key == 'A') left = true;
  if (key == 'd' || key == 'D') right = true;
  if (key == 'w' || key == 'W') up = true;
  if (key == 's' || key == 'S') down = true;
  if (key == ' ') shoot = true;
  if (keyCode == SHIFT) boost = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') left = false;
  if (key == 'd' || key == 'D') right = false;
  if (key == 'w' || key == 'W') up = false;
  if (key == 's' || key == 'S') down = false;
  if (key == ' ') shoot = false;
  if (keyCode == SHIFT) boost = false;
}
