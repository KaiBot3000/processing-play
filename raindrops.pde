void setup() {
    size(400, 400);
    background(240);
}

void draw() {
}

void mousePressed() {
    background();
    noFill();
    stroke(180);
    ellipse(mouseX, mouseY, 15, 15);
}

// objects with radius, center
// on click create object
// on draw increment radius of all objects
// color as a function of radius
// remove when radius is certain size