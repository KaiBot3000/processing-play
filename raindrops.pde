int BASE_COLOR = 240;
ArrayList<Ripple> ripples = new ArrayList<Ripple>();


void setup() {
    size(400, 400);
    background(BASE_COLOR);
}

void draw() {
    background(BASE_COLOR);
    for (int i=0; i<ripples.size(); i++) {
        Ripple ripple = ripples.get(i);
        if (ripple.hide) {
            ripples.remove(i);
        } else {
            ripple.update();
            ripple.display();
        }
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
    Ripple(float x, float y) {
        this.x = x;
        this.y = y;
        radius = 1;
        color = BASE_COLOR-100;
    }

    void update() {
        if (color >= BASE_COLOR) {
            hide = true;
        }
        radius += 3;
        color += 1;
    }

    void display() {
        noFill();
        stroke(color);
        ellipse(x, y, radius, radius);
    }
}