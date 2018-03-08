// nodes
// click to create nodes
// multiplier
// for every added node, connect using multiplier


// automode where new random points added, new lines appear, old lines fade

ArrayList<Node> nodes = new ArrayList<Node>();

int MULTIPLIER = 3;
int BACKGROUND_COLOR = 200;
void setup() {
    size(400, 400);
    background(BACKGROUND_COLOR);
}

void draw() {
    background();
    displayNodes();
    displayConnections();
}

void mousePressed() {
    nodes.add(new Node(mouseX, mouseY));
}

void displayNodes() {
    for (int i=0; i<nodes.size(); i++) {
        Node node = nodes.get(i);
        node.life = node.life - 1;
        if (node.life <= 0) {
            nodes.remove(i);
        } else {
            node.display();
        }
    }
}

void displayConnections() {
    for (int i=0; i<nodes.size(); i++) {
        Node start = nodes.get(i);
        Node end = nodes.get((MULTIPLIER * i) % nodes.size());
        line(start.x, start.y, end.x, end.y);
    }
}

class Node {
    float x, y;
    int radius, color, life;

    Node(float x, float y) {
        this.x = x;
        this.y = y;
        radius = 3;
        life = frameRate * 25; // not as expected
        color = BACKGROUND_COLOR - 50;
    }

    void display() {
        stroke(color);
        fill(color);
        ellipse(x, y, radius, radius);
    }
}