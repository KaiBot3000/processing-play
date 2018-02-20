int BASE_COLOR = 240;
ArrayList<Ripple> ripples = new ArrayList<Ripple>();


void setup() {
    size(400, 400);
    background(BASE_COLOR);
}

void draw() {
    background();
    for (Ripple ripple : ripples) {
        ripple.update();
        ripple.display();
    }
}

void mousePressed() {
    ripples.add(new Ripple(mouseX, mouseY));
}

class Ripple {
    float x, y;
    int radius, color;
    boolean hide = false;

    // Constructor
    Ripple(float xTemp, float yTemp) {
        x = xTemp;
        y = yTemp;
        radius = 5;
        color = BASE_COLOR-100; // 140
    }

    void update() {
        if (radius >= 60) {
            hide = true;
        }
        radius += 3;
        color -= 1;
    }

    void display() {
        noFill();
        stroke(color);
        ellipse(x, y, radius, radius);
    }
}