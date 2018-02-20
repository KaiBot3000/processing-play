// https://processing.org/examples/storinginput.html

int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
    size(400, 400);
    noStroke();
    fill(255);
}

void draw() {
    background(51);
    // each ellipse will last 60 frames; this loops through
    int which = frameCount % num;
    // reset oldest with new input
    mx[which] = mouseX;
    my[which] = mouseY;

    // loop through array
    for (int i=0; i<num; i++) {
        // which+1 is the oldest- the next in the array
        int index = (which+1 + i) % num;
        // draw an ellipse at x,y with diameter i
        ellipse(mx[index], my[index], i, i);
    }
}
