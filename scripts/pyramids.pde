ArrayList<Pyramid> pyramids = new ArrayList<Pyramid>();

int CANVAS_HEIGHT = 400;
int BACKGROUND_COLOR = 250;

void setup() {
    size(CANVAS_HEIGHT*2, CANVAS_HEIGHT);
    background(BACKGROUND_COLOR);
}

void draw() {
    background(BACKGROUND_COLOR);

    if (frameCount % 50 === 0) {
        pyramids.add(new Pyramid());
    }
    for (int i=0; i<pyramids.size(); i++) {
        Pyramid pyramid = pyramids.get(i);
        if (pyramid.hide) {
            pyramids.remove(i);
        } else {
            pyramid.update();
            pyramid.display();
        }
    }
}

class Pyramid {
    float span, pointX, pointY, color;
    boolean hide = false;

    // Constructor
    Pyramid() {
        this.pointX = Math.random()*(CANVAS_HEIGHT*2);
        this.pointY = 0;
        this.span = Math.random()*50;
        this.color = BACKGROUND_COLOR - this.span;
    }

    void update() {
        if ((pointY-(2*span)) >= CANVAS_HEIGHT ||
            color >= BACKGROUND_COLOR) {
            hide = true;
        }
        this.pointY = this.pointY + 1;
        color = color + 0.05;
    }

    void display() {
        fill(int(this.color));
        stroke(BACKGROUND_COLOR);
        triangle(pointX, pointY, (pointX-this.span), (pointY-(2*this.span)), (pointX+this.span), (pointY-(2*this.span)));
    }
}