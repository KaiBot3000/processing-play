ArrayList<Nail> nails = new ArrayList<Nail>();

int radius = 350;
int numPoints = 10;
int pointRadius = 3;
float multiplier = 99;

void setup() {
    size(800, 800);
    background(240);
    fill(0);
    // displayCircle(radius, numPoints);
    // displayMultiples();
}

void draw() {
    background();
    displayCircle(radius, numPoints);
    displayMultiples();
}

void displayCircle(radius, points) {
    float angle = TWO_PI/(float)points;
    for (int i=0; i<points; i++) {
        nails.add(new Nail(radius*sin(angle*i) + (width/2), radius*cos(angle*i) + (height/2)));
    }
    for (Nail nail : nails) {
        nail.display();
    }
}

void displayMultiples() {
    for (int i=0; i<nails.size(); i++) {
        Nail start = nails.get(i);
        Nail end = nails.get((multiplier * i) % numPoints);
        // possibly lines getting drawn twice because of overlap- there are actually two lines with that math
        // could add to dict / dedupe then draw
        // but why would that only be the case when ran in draw() but not setup()?
        line(start.x, start.y, end.x, end.y);
    }
}

class Nail {
    float x, y;
    int radius, color;

    Nail(float x, float y) {
        this.x = x;
        this.y = y;
        radius = 3;
        color = 0;
    }

    void display() {
        stroke(color);
        fill(color);
        ellipse(x, y, radius, radius);
    }
}

/*
 * Slider
 */

void updateMultiplier(float sliderMultiplier) {
    multiplier = sliderMultiplier;
} 
