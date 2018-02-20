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

void setup() {
    size(400, 400);
    background(240);
    drawCircle(radius, numPoints);
}

void drawCircle(radius, points) {
    float angle = TWO_PI/(float)points;
    for ( int i=0; i<points; i++) {
        nails.add(new Nail(radius*sin(angle*i) + (width/2), radius*cos(angle*i) + (height/2)));
    }
    for (Nail nail : nails) {
        nail.display();
    }
}

class Nail {
    float x, y;
    int radius, color;

    Nail(float xTemp, float yTemp) {
        x = xTemp;
        y = yTemp;
        radius = 3;
        color = 0;
    }

    void display() {
        stroke(color);
        ellipse(x, y, radius, radius);
    }
}





