/*
nodes
add new node on click
transparent connecting boxes to nodes
circles over nodes drawn last

grey background white boxes orange circles

boxes drawn between two closest nodes of each node

start:
nodes
boxes between first and last node
click add nodes

*/

ArrayList<Node> nodes = new ArrayList<Node>();
int HEIGHT = 400;
int WIDTH = 400;
int CENTER = WIDTH / 2;
int DIAMETER = 25;
int RADIUS = DIAMETER / 2;
int STICKY_THRESHOLD = 10;

void setup() {
    size(400, 400);
    background(200);
}

void onClick() {
    background();
    drawConnections();
    drawNodes();
}

void mousePressed() {
    if (mouseX > (CENTER - DIAMETER) && mouseX < (CENTER + DIAMETER)) {
        nodes.add(new Node(CENTER, mouseY));
        nodes.add(new Node(CENTER, mouseY));
    } else {
        nodes.add(new Node(mouseX, mouseY));
        nodes.add(new Node((WIDTH - mouseX), mouseY));
    }
    onClick();
}

void drawConnections() {
    // gross way to get boxes
    // strokeWeight(RADIUS);

    fill(220);
    // connect first nodes
    if (nodes.size() > 1) {
        Node first = nodes.get(0);
        Node second = nodes.get(1);
        // line(first.x, first.y, second.x, second.y);
        int[][] points = calculateBox(first, second);
        quad(points[0][0], points[0][1], points[1][0], points[1][1], points[2][0], points[2][1], points[3][0], points[3][1]);
    }
    // connect last nodes
    if (nodes.size() > 3) {
        Node last = nodes.get(nodes.size()-1);
        Node penultimate = nodes.get(nodes.size()-2);
        int[][] points = calculateBox(last, penultimate);
        quad(points[0][0], points[0][1], points[1][0], points[1][1], points[2][0], points[2][1], points[3][0], points[3][1]);
    }
    // connect middle nodes, mirrored
    for (int i=0; i<nodes.size()-2; i++) {
        Node start = nodes.get(i);
        Node end = nodes.get(i+2);
        int[][] points = calculateBox(start, end);
        quad(points[0][0], points[0][1], points[1][0], points[1][1], points[2][0], points[2][1], points[3][0], points[3][1]);
    }
}

// calculateBox({x: 1, y: 7},{x: 7, y: 7});
void calculateBox(node1, node2) {
    // ArrayList<Point> points = new ArrayList<Point>();
    int[][] points = new int[4][2]; // create a list of 4 elements, each having two elements

    if (node1.y === node2.y) { // is a flat box, 0 slope
        points[0] = [node2.x, node2.y+RADIUS];
        points[1] = [node1.x, node1.y+RADIUS];
        points[2] = [node1.x, node1.y-RADIUS];
        points[3] = [node2.x, node2.y-RADIUS];
    } else if (node1.x === node2.x) { // is a vertical box, infinite slope
        points[0] = [node1.x+RADIUS, node1.y];
        points[1] = [node1.x-RADIUS, node1.y];
        points[2] = [node2.x-RADIUS, node2.y];
        points[3] = [node2.x+RADIUS, node2.y];

    } else {
        // find slope
        float m = ((node1.y - node2.y) / (node1.x - node2.x)) * (-1);

        float dx = (1 / sqrt(1 + (m * m)));
        float dy = m * dx;

        points[0] = [node1.x+dx, node1.y-dy];
        points[1] = [node2.x+dx, node2.y+dy];
        points[2] = [node1.x-dx, node1.y-dy];
        points[3] = [node2.x-dx, node2.y-dy];
    }
    return points;
}

void drawNodes() {
    // tidier loop for when you don't need to remove things or handle multiple nodes at a time
    for (Node node: nodes) {
        node.display();
    }
}

class Point {
    float x, y;
    Point(float x, float y) {
        this.x = x;
        this.y = y;
    }
}

class Node {
    float x, y;
    int radius, color;

    Node(float x, float y) {
        this.x = x;
        this.y = y;
        diameter = DIAMETER;
    }

    void display() {
        strokeWeight(1);
        stroke(0);
        fill(239, 125, 26);
        ellipse(x, y, diameter, diameter);
    }
}