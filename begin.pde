
// ### hello world demo

// void setup()
// {
//   size(200,200);
//   background(125);
//   fill(255);
//   noLoop();
//   PFont fontA = loadFont('courier');
//   textFont(fontA, 14);
// }
// void draw(){
//   text('Hello Web!',20,20);
//   println('Hello ErrorLog!');
// }


// ### static sketch

// size(400, 400); //size
// background(192, 64, 0); //color
// stroke(255); // color
// line(15, 25, 70, 90); // 15,25 -> 70,90


// ### program 1 - arcs, rectangles, lines following mouse

// void setup() {
//   background(#bcff82);
//   size(400, 400);
//   stroke(0);
//   fill(#76f707);
//   noStroke();
//   rectMode(CENTER); // default is corner; here the first two are center, second width/height
//   rect(width/2, height/2, width/2, height/2);
//   fill(#07d7f7);
//   arc(width/2, height/2, width/2, height/2, -PI, 0);
// }
// void draw() {
//   line(width/2, height/2, mouseX, mouseY);
// }
// void mousePressed() {
//   background(#ff4000);
// }


// ### program 2 - spline play

// void setup() {
//   size(400, 400);
//   background(128);
//   stroke(0);
// }
// void mousePressed() {
//   background(128);
//   ellipse(mouseX, mouseY, 10, 10); //control points
//   ellipse(0, 120, 10, 10); //control points
//   curve(0, 120, 80, 60, 300, 300, mouseX, mouseY);
// }

// ### program 3 - continuous spline curves

// void setup() {
//   size(400, 400);
//   background(90);
//   noFill();
//   stroke(0);
//   beginShape();
//   curveVertex(20, 20); // beginning and end are control vertices; repeat
//   curveVertex(20, 20);
//   curveVertex(80, 60);
//   curveVertex(100, 120);
//   curveVertex(200, 180);
//   curveVertex(300, 300);
//   curveVertex(300, 300);
//   endShape();

//   ellipse(300, 300, 10, 10);
// }

// ### program 4 - bezier curves

// void setup() {
//   size(400, 400);
// }
// void mousePressed() {
//   background(128);
//   stroke(0);
//   noFill();
//   beginShape();
//   vertex(50, 75); // call out first point
//   bezierVertex(mouseX, mouseY, 300, 50, 300, 300);
//   endShape();
// }


// ### 5 - bouncing ball
// float x = 100;
// float y = 50;
// float xspeed = 0.3;
// float yspeed = 1;

// void setup() {
//   size(100, 100);
//   smooth();
//   background(128);
// }

// void draw() {
//   noStroke();
//   fill(255, 0);
//   rect(0,0,width,height);

//   x = x + xspeed;
//   y = y + yspeed;

//   if ((x>width) || (x<0)) {
//     xspeed = xspeed * -1;
//   }
//   if ((y>width) || (y<0)) {
//     yspeed = yspeed * -1;
//   }

//   stroke(0);
//   fill(175);
//   ellipse(x,y,16,16);
// }
