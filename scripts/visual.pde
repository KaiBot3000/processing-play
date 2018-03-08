float x = 100;
float y = 50;
float xspeed = 0.3;
float yspeed = 1;

void setup() {
  size(100, 100);
  smooth();
  background(128);
}

void draw() {
  noStroke();
  fill(255, 0);
  rect(0,0,width,height);

  x = x + xspeed;
  y = y + yspeed;

  if ((x>width) || (x<0)) {
    xspeed = xspeed * -1;
  }
  if ((y>width) || (y<0)) {
    yspeed = yspeed * -1;
  }

  stroke(0);
  fill(175);
  ellipse(x,y,16,16);
}