ArrayList<Nail> nails = new ArrayList<Nail>();

int radius = 350;
int numPoints = 200;
int pointRadius = 2;
float multiplier = 2;

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
    nails.clear();
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
