/*
Inspired by a shirt I saw at the Recurse center,
which was album art done for Bon Iver by 
Brooklyn-based artist Eric Timothy Carlson:
http://www.erictimothycarlson.com/
*/

ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Node> clicks = new ArrayList<Node>();
ArrayList<Node> reflections = new ArrayList<Node>();
ArrayList<Box> boxes = new ArrayList<Box>();

// canvas
int HEIGHT = 400;
int WIDTH = 400;
int CENTER = WIDTH / 2;

// nodes
float DIAMETER = 25;
float RADIUS = DIAMETER / 2;

// stylies
color BACKGROUND_COLOR = 50;
color BOX_COLOR = 225;
color STROKE_COLOR = 0;
color NODE_COLOR = color(255, 92, 5);

void setup() {
    size(400, 400);
    background(BACKGROUND_COLOR);
    strokeWeight(2);
}

void mousePressed() {
    // add new points to array
    if (mouseX > (CENTER - DIAMETER) && mouseX < (CENTER + DIAMETER)) {
        clicks.add(new Node(CENTER, mouseY));
        reflections.add(new Node(CENTER, mouseY));
    } else {
        clicks.add(new Node(mouseX, mouseY));
        reflections.add(new Node((WIDTH - mouseX), mouseY));
    }

    // generate combined list for calculating connetions
    nodes.clear();
    nodes.addAll(clicks);
    nodes.addAll(reflections);

    // draw results
    background();
    drawBoxes();
    drawNodes();
}

void drawBoxes() {
    for (int i=0; i<nodes.size(); i++) {
        Node start = nodes.get(i);
        if (i === nodes.size() - 1) {
            Node end = nodes.get(0);
        } else {
            Node end = nodes.get(i+1);
        }
        int[][] points = calculateBox(start, end);
        boxes.add(new Box(points));
    }

    for (Box box: boxes) {
        box.displayQuad();
    }
    for (Box box: boxes) {
        box.displayLines();
    }
}

void calculateBox(node1, node2) {
    float [][] points = new float [4][2];

    if (node1.y === node2.y) { // is a flat box, 0 slope
        points[0] = [node1.x, node1.y+RADIUS];
        points[1] = [node2.x, node2.y+RADIUS];
        points[2] = [node2.x, node2.y-RADIUS];
        points[3] = [node1.x, node1.y-RADIUS];
    } else if (node1.x === node2.x) { // is a vertical box, infinite slope
        points[0] = [node1.x-RADIUS, node1.y];
        points[1] = [node2.x-RADIUS, node2.y];
        points[2] = [node2.x+RADIUS, node2.y];
        points[3] = [node1.x+RADIUS, node1.y];
    } else {
        float m = (-1) / ((node1.y - node2.y) / (node1.x - node2.x));
        float dx = RADIUS / sqrt(1 + (m * m));
        float dy = m * dx;

        points[0] = [node1.x+dx, node1.y+dy];
        points[1] = [node2.x+dx, node2.y+dy];
        points[2] = [node2.x-dx, node2.y-dy];
        points[3] = [node1.x-dx, node1.y-dy];
    }
    return points;
}

void drawNodes() {
    for (Node node: nodes) {
        node.display();
    }
}

class Node {
    float x, y;

    Node(float x, float y) {
        this.x = x;
        this.y = y;
    }

    void display() {
        stroke(STROKE_COLOR);
        fill(NODE_COLOR);
        ellipse(x, y, DIAMETER, DIAMETER);
    }
}

class Box {
    float [][] points = new float [4][2];

    Box(points) {
        this.points = points;
    }

    void displayQuad() {
        noStroke();
        fill(BOX_COLOR);
        quad(points[0][0], points[0][1], points[1][0], points[1][1], points[2][0], points[2][1], points[3][0], points[3][1]);
    };

    void displayLines() {
        stroke(STROKE_COLOR);
        line(points[0][0], points[0][1], points[1][0], points[1][1]);
        line(points[2][0], points[2][1], points[3][0], points[3][1]);
    };
}
