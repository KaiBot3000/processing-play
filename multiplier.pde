// base
//multiplier

//ex base 10, multiple 2 
//2 = cardioid
// cool to do floats
//3 = nephroid

// times table modulo 200

// petals = n-1

int radius = 175;
int numPoints = 200;
int pointRadius = 3;

void setup() {
    size(400, 400);
    background(240);
    drawCircle(radius, numPoints);
}

void drawCircle(radius, points) {
    stroke(0);
    fill(0);
    float angle = TWO_PI/(float)points;
    for ( int i=0; i<points; i++) {
        ellipse(radius*sin(angle*i) + (width/2), radius*cos(angle*i) + (height/2), pointRadius, pointRadius);
    }
}

