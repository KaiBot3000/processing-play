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
int RADIUS = 25;
int STICKY_THRESHOLD = 10;

void setup() {
    size(400, 400);
    background(200);
}

void draw() {
    background();
    drawConnections();
    drawNodes();
}

void mousePressed() {
    if (mouseX > (CENTER - STICKY_THRESHOLD) && mouseX < (CENTER + STICKY_THRESHOLD)) {
        nodes.add(new Node(CENTER, mouseY));
        nodes.add(new Node(CENTER, mouseY));
    } else {
        nodes.add(new Node(mouseX, mouseY));
        nodes.add(new Node((WIDTH - mouseX), mouseY));
    }
}

void drawConnections() {
    // connect first nodes
    if (nodes.size() > 1) {
        Node first = nodes.get(0);
        Node second = nodes.get(1);
        line(first.x, first.y, second.x, second.y);
    }
    // conect last nodes
    if (nodes.size() > 3) {
        Node last = nodes.get(nodes.size()-1);
        Node penultimate = nodes.get(nodes.size()-2);
        line(last.x, last.y, penultimate.x, penultimate.y);
    }
    // connect middle nodes, mirrored
    for (int i=0; i<nodes.size()-2; i++) {
        Node start = nodes.get(i);
        Node end = nodes.get(i+2);
        line(start.x, start.y, end.x, end.y);
    }
}

void drawNodes() {
    // tidier loop for when you don't need to remove things or handle multiple nodes at a time
    for (Node node: nodes) {
        node.display();
    }
}

class Node {
    float x, y;
    int radius, color;

    Node(float x, float y) {
        this.x = x;
        this.y = y;
        radius = RADIUS;
    }

    void display() {
        stroke(0);
        fill(239, 125, 26);
        ellipse(x, y, radius, radius);
    }
}