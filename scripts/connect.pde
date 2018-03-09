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
int RADIUS = 5;

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
    nodes.add(new Node(mouseX, mouseY));
}

void drawConnections() {
    // figure out which nodes to connect
    // for now connect in a chain
    for (int i=0; i<nodes.size()-1; i++) {
        Node start = nodes.get(i);
        Node end = nodes.get(i+1);
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
        color = 250;
    }

    void display() {
        stroke(color);
        fill(color);
        ellipse(x, y, radius, radius);
    }
}