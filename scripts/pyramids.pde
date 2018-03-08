ArrayList<Pyramid> pyramids = new ArrayList<Pyramid>();

int CANVAS_HEIGHT = 400;

void setup() {
    size(CANVAS_HEIGHT*2, CANVAS_HEIGHT);
    background(200);
}

void draw() {
    background(200);

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
    float span, pointX, pointY;
    int color;
    boolean hide = false;

    // pyramid appears
    // has set color, smaller are paler
    //   - z index?
    // color fades every frame
    // pyramid falls every frame

    // Constructor
    Pyramid() {
        this.pointX = Math.random()*(CANVAS_HEIGHT*2);
        this.pointY = 0;
        this.span = 50; // should randomize
        this.color = 100; // should be related to size
    }

    void update() {
        // y drops
        // color fades
        if ((pointY-(2*span)) >= CANVAS_HEIGHT) {
            hide = true;
        }
        this.pointY = this.pointY + 1;
        // color = color - 1;
    }

    void display() {
        //  triangle(x1, y1, x2, y2, x3, y3)
        fill(this.color);
        stroke(this.color);
        triangle(pointX, pointY, (pointX-this.span), (pointY-(2*this.span)), (pointX+this.span), (pointY-(2*this.span)));
    }
}