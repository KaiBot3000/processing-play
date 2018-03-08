void setup() {
    size(255, 255);
    frameRate(4);
}

void draw() {
    background(abs(mouseX - pmouseX));
}
