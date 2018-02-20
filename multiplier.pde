// base
//multiplier

//ex base 10, multiple 2 
//2 = cardioid
// cool to do floats
//3 = nephroid

// times table modulo 200

// petals = n-1

ArrayList<Nail> nails = new ArrayList<Nail>();

int radius = 175;
int numPoints = 200;
int pointRadius = 3;
float multiplier = 2;

void setup() {
    size(400, 400);
    background(240);
    drawCircle(radius, numPoints);
}

void drawCircle(radius, points) {
    float angle = TWO_PI/(float)points;
    for (int i=0; i<points; i++) {
        nails.add(new Nail(radius*sin(angle*i) + (width/2), radius*cos(angle*i) + (height/2)));
    }
    for (Nail nail : nails) {
        nail.display();
    }
    displayMultiples();
}

void displayMultiples() {
    stroke(0);
    for (int i=0; i<nails.size(); i++) {
        Nail start = nails.get(i);
        Nail end = nails.get((multiplier * i) % numPoints);
        println((multiplier * i) % numPoints);
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
        ellipse(x, y, radius, radius);
    }
}
